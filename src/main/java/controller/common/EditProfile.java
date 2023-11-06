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
	private static final String FOWARD_USER = "/main/myaccount.jsp";
	private static final String FOWARD_ADMIN = "/main/adminaccount.jsp";

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
		String acc = request.getParameter("acc");
		String foward="";
		if(acc.equals("user")) {
			foward = FOWARD_USER;
		}
		if(acc.equals("admin")) {
			foward = FOWARD_ADMIN;
		}
		request.getRequestDispatcher(foward).forward(request, response);
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
		String hidInput = request.getParameter("role");
		String foward ="";
		/*
		 * String uemail = request.getParameter("email");
		 */
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		user.setFirstName(ufirst_name);
		user.setLastName(ulast_name);
		user.setPhone(uphone);
		user.setAddress(uaddress);
		/*
		 * user.setEmail(uemail);
		 */

		UserDAO userDao = new UserDAO();
		userDao.editProfile(user);
		if(hidInput.equals("user")) {
			foward = "/main/myaccount.jsp";
		} 
		if(hidInput.equals("admin")) {
			foward = "/main/adminaccount.jsp";
		} 
		request.getRequestDispatcher(foward).forward(request, response);

	}

}