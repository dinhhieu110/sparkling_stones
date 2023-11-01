package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dao.UserDAO;

/**
 * Servlet implementation class EditProfile
 */
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/myaccount.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProfile() {
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
		String ufirst_name = request.getParameter("firstName");
		String ulast_name = request.getParameter("lastName");
		String uphone = request.getParameter("phone");
		String uaddress = request.getParameter("address");
		String uemail = request.getParameter("email");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		user.setFirstName(ufirst_name);
		user.setLastName(ulast_name);
		user.setPhone(uphone);
		user.setAddress(uaddress);
		user.setEmail(uemail);


		UserDAO userDao = new UserDAO();
		userDao.editProfile(user);
		
		request.getRequestDispatcher("/main/myaccount.jsp").forward(request, response);

	}

}