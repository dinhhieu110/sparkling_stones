package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.Review;

import java.io.IOException;
import java.util.List;

import dao.ProductDAO;
import dao.ReviewDAO;

/**
 * Servlet implementation class DetailController
 */
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FORWARD_PAGE = "/main/detail.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		ProductDAO dao = new ProductDAO();
		ReviewDAO rDao = new ReviewDAO();
		Product product = dao.getProductById(id);
		List <Product> otherProducts = dao.getOtherProducts();
		List<Review> reviews = rDao.getReviewsByProductId(id);
		
		dao.close();
		rDao.close();
		
		if (product != null) {
			request.setAttribute("product", product);
			request.setAttribute("reviews", reviews);
			request.setAttribute("otherP", otherProducts);
			request.getRequestDispatcher(FORWARD_PAGE).forward(request, response);
		} else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
