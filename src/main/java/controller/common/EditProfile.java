package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.UserDAO;

/**
 * Servlet implementation class EditProfile
 */
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ufirst_name = request.getParameter("firstName");
		String ulast_name = request.getParameter("lastName");
		String uphone = request.getParameter("phone");
		String uaddress = request.getParameter("address");
		String uemail = request.getParameter("email");
		UserDAO user = new UserDAO();
		user.editProfile(ufirst_name, ulast_name, uphone, uaddress, uemail);
		response.sendRedirect("my-account");
	}

}
