package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
		
		String minPriceParam = request.getParameter("minPrice");
        String maxPriceParam = request.getParameter("maxPrice");
        String categoryId = request.getParameter("categoryId");

        try {
            int minPrice = (minPriceParam != null && !minPriceParam.isEmpty()) ? Integer.parseInt(minPriceParam) : 0;
            int maxPrice = (maxPriceParam != null && !maxPriceParam.isEmpty()) ? Integer.parseInt(maxPriceParam) : Integer.MAX_VALUE;
            HttpSession session = request.getSession();
            session.setAttribute("minPrice", minPrice);
            session.setAttribute("maxPrice", maxPrice);


            if (categoryId != null && !categoryId.isEmpty()) {
                CategoryDAO cDao = new CategoryDAO();
                ProductDAO pagingDao = new ProductDAO();
				/*
				 * session.setAttribute("categoryId", categoryId);
				 */                int countProducts = pagingDao.getTotalByCategoryPriceRange(categoryId, minPrice, maxPrice);
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
                request.setAttribute("categoryId", categoryId);

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
            e.printStackTrace(); // Handle the conversion error if needed
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
