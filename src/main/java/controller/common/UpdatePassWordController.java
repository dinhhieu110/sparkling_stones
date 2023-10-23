package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.EncryptionService;
import util.Template;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.UserDAO;

public class UpdatePassWordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/resetpassword.jsp";

	public UpdatePassWordController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/main/login.jsp";

		String newPassword = request.getParameter("newpass");
		String cfmNewPassword = request.getParameter("cfmnewpass");

		UserDAO dao = new UserDAO();
		String type = "";
		String error = "";
		String email = request.getParameter("email");
		if (newPassword.equals(cfmNewPassword)) {
			User user = dao.getUserByEmail(email);
			if (user != null) {
				EncryptionService ecrypt = new EncryptionService();
				newPassword = ecrypt.encryptMD5(newPassword);
				dao.updatePassword(email, newPassword);
			} else {

				type = "danger";
				error = "Account does not exist!";
			}

		} else {
			type = "danger";
			error = "Password does not match";
		}
		dao.close();
		if (error.equals("") && type.equals("")) {
			response.sendRedirect(SUCCESS_FORWARD);
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
