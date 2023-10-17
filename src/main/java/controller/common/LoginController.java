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
		// TODO Auto-generated method stub
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("lemail");
		String password = request.getParameter("lpassword");

		EncryptionService encryptionService = new EncryptionService();
		String encryptedInputPassword = encryptionService.encryptMD5(password);

		UserDAO dao = new UserDAO();
		User user = new User();
		/*
		 * String storedPassword = dao.getPassByEmail(email);
		 * System.out.println(storedPassword);
		 * System.out.println(encryptedInputPassword);
		 */

		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("acc", user);
			String storedPassword = dao.getPassByEmail(email);

			if (storedPassword != null && storedPassword.equals(encryptedInputPassword)) {
				user = dao.login(email, password);

				request.getRequestDispatcher("home").forward(request, response);
			} else {
				request.setAttribute("mess", "Wrong email or password");
				request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
			}

		} else {
			request.setAttribute("mess", "Wrong email or password");
			request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		}

	}

}
