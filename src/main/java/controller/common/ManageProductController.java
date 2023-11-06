package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.ProductDAO;

/**
 * Servlet implementation class ManageProductController
 */
public class ManageProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/productmanagement.jsp";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productdao = new ProductDAO();
		List<Product> list = new ArrayList<Product>();

		int countP = productdao.getTotalProducts();
		int size = 9;
		int endPage = countP / size;
		if (countP % size != 0) {
			endPage++;
		}

		String indexPage = request.getParameter("index");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		list = productdao.getProductsEachPage(index);

		request.setAttribute("listP", list);
		request.setAttribute("endP", endPage);
		request.setAttribute("tag", index);
		request.setAttribute("from", "ManageProductController");

		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/ManageProductController";

		String action = request.getParameter("action");

		ProductDAO productDao = new ProductDAO();

		String foward = "";

		switch (action) {
		case "delete": {
			String id = request.getParameter("myDeleteProduct");
			productDao.deleteProduct(id);
			foward = SUCCESS_FORWARD + "?status=SuccessfullyDeleted";
			break;
		}

		case "edit": {

		}

		case "add": {

		}

		}
		productDao.close();
		response.sendRedirect(foward);

	}

}
