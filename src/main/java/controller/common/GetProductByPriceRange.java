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

import dao.CategoryDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class GetProductByPriceRange
 */
public class GetProductByPriceRange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/list.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetProductByPriceRange() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * // Lấy giá trị tối thiểu và tối đa từ yêu cầu HTTP int minPrice =
		 * Integer.parseInt(request.getParameter("minPrice")); int maxPrice =
		 * Integer.parseInt(request.getParameter("maxPrice"));
		 * request.setAttribute("minPrice", minPrice); request.setAttribute("maxPrice",
		 * maxPrice); // Gọi phương thức trong ProductDAO để lấy danh sách sản phẩm theo
		 * khoảng giá ProductDAO productDAO = new ProductDAO(); CategoryDAO cDao = new
		 * CategoryDAO(); int countProducts =
		 * productDAO.getTotalProductByRange(maxPrice, minPrice); int size = 9; int
		 * endPage = countProducts/size; if(countProducts % size != 0) { endPage++; }
		 * 
		 * String indexPage = request.getParameter("index"); if(indexPage == null) {
		 * indexPage = "1"; } List<Category> listOfCates = cDao.getCategories();
		 * 
		 * int index = Integer.parseInt(indexPage); List<Product> listByRange =
		 * productDAO.getProductsByPriceRange(minPrice, maxPrice, index);
		 * 
		 * System.out.println(listByRange); request.setAttribute("tag", index);
		 * request.setAttribute("endP",endPage); request.setAttribute("listP",
		 * listByRange); request.setAttribute("listOfCates", listOfCates);
		 * 
		 * request.setAttribute("from", "shop");
		 * request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		 */
		String minPriceParam = request.getParameter("minPrice");
		String maxPriceParam = request.getParameter("maxPrice");

		// Kiểm tra xem có giá trị không và có phải là số không
		if (minPriceParam != null && maxPriceParam != null && !minPriceParam.isEmpty() && !maxPriceParam.isEmpty()) {
		    try {
		        int minPrice = Integer.parseInt(minPriceParam);
		        int maxPrice = Integer.parseInt(maxPriceParam);

		        // Tiếp tục xử lý với giá trị minPrice và maxPrice
		        // ...
		        
		        // Lưu giữ giá trị vào request (để hiển thị lại trên trang JSP)
		        request.setAttribute("minPrice", minPrice);
		        request.setAttribute("maxPrice", maxPrice);
		        
		        // Gọi phương thức trong ProductDAO để lấy danh sách sản phẩm theo khoảng giá
		        ProductDAO productDAO = new ProductDAO();
		        CategoryDAO cDao = new CategoryDAO();
		        int countProducts = productDAO.getTotalProductByRange(maxPrice, minPrice);
		        int size = 9;
		        int endPage = countProducts / size;
		        if (countProducts % size != 0) {
		            endPage++;
		        }

		        String indexPage = request.getParameter("index");
		        if (indexPage == null) {
		            indexPage = "1";
		        }
		        List<Category> listOfCates = cDao.getCategories();

		        int index = Integer.parseInt(indexPage);
		        List<Product> listByRange = productDAO.getProductsByPriceRange(minPrice, maxPrice, index);

		        request.setAttribute("tag", index);
		        request.setAttribute("minPrice", minPrice);
		        request.setAttribute("maxPrice", maxPrice);
		        request.setAttribute("endP", endPage);
		        request.setAttribute("listP", listByRange);
		        request.setAttribute("listOfCates", listOfCates);

		        request.setAttribute("from", "shop");
		        request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);

		    } catch (NumberFormatException e) {
		        e.printStackTrace(); // Xử lý lỗi chuyển đổi nếu cần
		    }
		}
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
