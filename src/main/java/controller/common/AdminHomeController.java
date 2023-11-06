package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

import dao.ProductDAO;
import dao.UserDAO;

/**
 * Servlet implementation class AdminHomeController
 */
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/adminhome.jsp";

    public AdminHomeController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO uDao = new UserDAO();
		int totalUser = uDao.getTotalUser();
		ProductDAO pDao = new ProductDAO();
		int totalProduct = pDao.getTotalProducts();
		
		uDao.close();
		request.setAttribute("totalUser", totalUser);
		request.setAttribute("totalProduct", totalProduct);
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
