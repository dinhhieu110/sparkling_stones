package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.CategoryDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class HomeController
 */
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/home.jsp";
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO pDao = new ProductDAO();
		CategoryDAO cDao = new CategoryDAO();
		
		List<Category> listOfCates = cDao.getCategories(); 
		List<Product> listOfProducts = pDao.getNewProducts();
		List<Product> listOfRecommendProducts = pDao.getRecommendedProducts();
		
		pDao.close();
		cDao.close();

		request.setAttribute("listOfCates", listOfCates);
		request.setAttribute("listProducts", listOfProducts);
		request.setAttribute("listRecommendProducts", listOfRecommendProducts);

		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
