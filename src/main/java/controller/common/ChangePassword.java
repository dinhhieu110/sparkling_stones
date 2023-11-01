package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.EncryptionService;
import util.Template;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.UserDAO;

/**
 * Servlet implementation class ChangePassword
 */
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/changepassword.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/home";
		
		String email = request.getParameter("email");
		String oldPassword = request.getParameter("oldpass");
		String newPassword = request.getParameter("newpass");
		String cfmNewPassword = request.getParameter("comfirmnewpass");

		UserDAO dao = new UserDAO();

		User user = dao.getUserByEmail(email);
		String type = "";
		String error = "";

		EncryptionService ecrypt = new EncryptionService();
		oldPassword = ecrypt.encryptMD5(oldPassword);
		if (oldPassword.equals(user.getPassword())) {

			if (newPassword.equals(cfmNewPassword)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				newPassword = ecrypt.encryptMD5(newPassword);
				dao.updatePassword(user.getEmail(), newPassword);

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
			response.sendRedirect(SUCCESS_FORWARD + "?status=SuccessfullyChangePassword");
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