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
import java.util.Iterator;
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
		final String USER_SUCCESS_FORWARD = request.getContextPath() + "/my-account";
		final String ADMIN_SUCCESS_FORWARD = request.getContextPath() + "/admin-account";

		
		String email = request.getParameter("email");
		String oldPassword = request.getParameter("oldpass");
		String newPassword = request.getParameter("newpass");
		String cfmNewPassword = request.getParameter("comfirmnewpass");
		String role = request.getParameter("role");
		UserDAO dao = new UserDAO();

		User user = dao.getUserByEmail(email);
		String type = "";
		String error = "";
		String forward ="";
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
				error = "Password does not match!";
			}

		} else {
			type = "danger";
			error = "Old password is incorrect";
		}
		dao.close();
		if (error.equals("") && type.equals("")) {
			if(role.equals("admin")) {
				forward = ADMIN_SUCCESS_FORWARD;
			}
			if(role.equals("user")) {
				forward = USER_SUCCESS_FORWARD;
			}
			response.sendRedirect(forward + "?status=SuccessfullyChangePassword");
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