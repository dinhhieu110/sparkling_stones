package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
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
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/login.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie arr[] = request.getCookies();
		if (arr != null) {
			for (Cookie o : arr) {
				if (o.getName().equals("userC")) {
					request.setAttribute("email", o.getValue());
				}
				if (o.getName().equals("passC")) {
					request.setAttribute("password", o.getValue());
				}
			}
		}

		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath();

		String email = request.getParameter("txtEmail").toLowerCase();
		String password = request.getParameter("txtPassword");
		String remember = request.getParameter("chkRemember");

		UserDAO dao = new UserDAO();
		User user = dao.getUserByEmail(email);

		String error = "";
		String type = "";

		if (user != null) {
			if (user.isVerified()) {
				EncryptionService encrypt = new EncryptionService();
				String ecryptPassword = encrypt.encryptMD5(password);
				if (ecryptPassword.equals(user.getPassword())) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					// lưu account lên cookie
					Cookie u = new Cookie("userC", email);
					Cookie p = new Cookie("passC", password);
					u.setMaxAge(60 * 60);
					if (remember != null) {
						p.setMaxAge(60 * 60);
					} else {
						p.setMaxAge(0);
					}
					response.addCookie(u);
					response.addCookie(p);
				} else {
					type = "danger";
					error = "Password is incorrect!";
				}
			} else {
				type = "warning";
				error = "Account has not been verified. <a href=\"verify-otp?email=" + email
						+ "\" class=\"alert-link\">Verify here</a>";
			}
		} else {
			type = "danger";
			error = "Email has not been registered!";
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
