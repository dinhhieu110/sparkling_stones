package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.CategoryDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class SortProductByPrice
 */
public class SortProductByPrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/list.jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortProductByPrice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO pagingDao = new ProductDAO();
        CategoryDAO cDao = new CategoryDAO();

        int countProducts = pagingDao.getTotalProducts();
        int size = 9;
        int endPage = countProducts/size;
        if (countProducts % size != 0) {
        	endPage++;
        }
        
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        List<Category> listOfCates = cDao.getCategories();

        List<Product> list = new ArrayList<>();
        // Get the sorting option from the request parameter
        String sortOption = request.getParameter("sortOption");
        
		switch (sortOption) {
		case "lowtohigh":
			list = pagingDao.getProductByPriceLowToHigh(index);
			break;
		case "hightolow":
			list = pagingDao.getProductByPriceHighToLow(index);
			break;
		default:
			// Handle other cases if needed
			list = pagingDao.getProductsEachPage(index);
			break;
		}
        request.setAttribute("listOfCates", listOfCates);
        request.setAttribute("sortOption", sortOption);

        request.setAttribute("tag", index);
        request.setAttribute("endP", endPage);
        request.setAttribute("listP", list);
        request.setAttribute("from","sort");
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
