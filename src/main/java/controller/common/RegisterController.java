package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.Template;
import util.EncryptionService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.UserDAO;

/**
 * Servlet implementation class RegisterController
 */
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/register.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/verify-otp";

		// Lấy thông tin đăng kí từ form
		String firstName = request.getParameter("txtFirstName");
		String lastName = request.getParameter("txtLastName");
		String email = request.getParameter("txtEmail").toLowerCase();
		String password = request.getParameter("txtPassword");
		String cfmPassword = request.getParameter("txtCfmPassword");

		UserDAO dao = new UserDAO();
		String error = "";
		String type = "";

		String forward = SUCCESS_FORWARD;

		// Kiểm tra 2 mật khẩu có trùng nhau
		if (password.equals(cfmPassword)) {
			User user = dao.getUserByEmail(email);
			if (user == null) {
				EncryptionService ecrypt = new EncryptionService();
				password = ecrypt.encryptMD5(password);
				dao.register(email, password, firstName, lastName);
				forward += "?email=" + email+"&otpTask=OtpRegister";
			} else {
				// Kiểm tra account đã được xác thực
				if (user.isVerified()) {
					type = "danger";
					error = "Email has been registered.";
				} else {
					type = "warning";
					error = "Account has not been verified. <a href=\"verify-otp?email="+ email +"&otpTask=OtpRegister\" class=\"alert-link\">Verify here</a>";
				}
			}
		} else {
			type = "danger";
			error = "Password does not match";
		}

		dao.close();
		if (error.equals("") && type.equals("")) {
			response.sendRedirect(forward);
		} else {
			// Lấy template thông báo lỗi
			Template template = new Template("template/alert.html");
			Map<String, String> replacements = new HashMap<String, String>();
			replacements.put("type", type);
			replacements.put("content", error);

			String alert = template.getTemplate(replacements);
			request.setAttribute("error", alert);
			doGet(request, response);
		}

	}

}
