package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.List;

import org.w3c.dom.Text;

import dao.CategoryDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class SearchController
 */
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/list.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		CategoryDAO cDao = new CategoryDAO();
		List<Category> listOfCates = cDao.getCategories();

		String originaTtxtSearch = request.getParameter("txt");
		String index = request.getParameter("index");
		if (index == null) {
			index = "1";
		}
		int indexPage = Integer.parseInt(index);
		String txtSearch = ("%" + originaTtxtSearch + "%").toLowerCase();
		ProductDAO searchDao = new ProductDAO();
		int count = searchDao.getNumSearchProducts(txtSearch);
		int size = 9;
		int endPage = count / size;
		if (count % size != 0) {
			endPage++;
		}

		List<Product> list = searchDao.searchByName(txtSearch, indexPage);

		searchDao.close();
		cDao.close();
		request.setAttribute("listOfCates", listOfCates);
		request.setAttribute("endP", endPage);
		request.setAttribute("listP", list);
		request.setAttribute("searchName", originaTtxtSearch);
		request.setAttribute("tag", indexPage);
		request.setAttribute("from", "search");

		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
