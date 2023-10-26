package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.ProductDAO;

/**
 * Servlet implementation class CartController
 */
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/cart.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			ProductDAO pDao = new ProductDAO();
			List<Product> listP = pDao.getOtherProducts();
			
			pDao.close();
			request.setAttribute("listP", listP);
			request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/main/login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
