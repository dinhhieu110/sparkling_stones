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
 * Servlet implementation class GetProductByCategoryAndPriceRange
 */
public class GetProductByCategoryAndPriceRange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/list.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetProductByCategoryAndPriceRange() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
            int minPrice = Integer.parseInt(request.getParameter("min_price"));
            int maxPrice = Integer.parseInt(request.getParameter("max_price"));
            String categoryId = request.getParameter("categoryId");

            if (categoryId != null && !categoryId.isEmpty()) {
                CategoryDAO cDao = new CategoryDAO();
                ProductDAO pagingDao = new ProductDAO();

                // Nếu categoryId không rỗng, lấy tổng số sản phẩm cho danh mục đó
                int countProducts = pagingDao.getTotalByCategoryPriceRange(categoryId, minPrice, maxPrice);
                // Gọi phương thức trong ProductDAO để lấy danh sách sản phẩm theo khoảng giá
                ProductDAO productDAO = new ProductDAO();

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
                
                List<Product> listByRange = productDAO.getProductsByCategoryPriceRange(categoryId, minPrice, maxPrice, index);
                
                request.setAttribute("minPrice", minPrice);
                request.setAttribute("maxPrice", maxPrice);
                request.setAttribute("tag", index);
                request.setAttribute("endP", endPage);
                request.setAttribute("listP", listByRange);
                request.setAttribute("listOfCates", listOfCates);
                request.setAttribute("from", "rangeCategory");
                request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
            } else {
                System.out.println("CategoryId không hợp lệ");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Xử lý lỗi chuyển đổi nếu cần
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
