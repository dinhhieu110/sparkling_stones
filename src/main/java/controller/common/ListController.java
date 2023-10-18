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
 * Servlet implementation class ListController
 */
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/list.jsp";
       

    public ListController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO pDao = new ProductDAO();
		CategoryDAO cDao = new CategoryDAO();
		ProductDAO pagingDao = new ProductDAO();
		int countProducts = pagingDao.getTotalProducts(); 
		int endPage = countProducts/9;
		if(countProducts % 9 != 0) {
			endPage ++;
		}
		
		String indexPage = request.getParameter("index"); // Lấy indexPage từ jsp về khi đc clicked
		if(indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		List<Product> list = pagingDao.getProductsEachPage(index);   // Truyền index sang phương thức ở DAO để nhận lại list
		
		
		List<Category> listOfCates = cDao.getCategories(); 
		
		cDao.close();
		pagingDao.close();
		
		request.setAttribute("listOfCates", listOfCates);
		request.setAttribute("endP", endPage);
		request.setAttribute("listP", list);
		request.setAttribute("tag", index);

		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
