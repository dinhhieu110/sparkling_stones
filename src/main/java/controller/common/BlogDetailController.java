package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.BlogDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class BlogDetailController
 */
public class BlogDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FORWARD_PAGE = "/main/blogdetail.jsp";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		ProductDAO dao = new ProductDAO();

		BlogDAO bdao = new BlogDAO();
		Blog blog = bdao.getBlogById(id);
		List <Product> otherProducts = dao.getOtherProducts();
		request.setAttribute("otherP", otherProducts);

		request.setAttribute("rblog", blog);
		request.getRequestDispatcher(FORWARD_PAGE).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
