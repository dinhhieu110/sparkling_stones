package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.User;

import java.io.IOException;

import dao.CartDAO;
import dao.OrderDAO;

/**
 * Servlet implementation class TrackingController
 */
public class PrintBillController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/OrderTracking.jsp";

    public PrintBillController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		long amount = Long.parseLong(request.getParameter("vnp_Amount"));
		String fullName = user.getLastName()+ " " + user.getFirstName();
		String userId = user.getId();
		OrderDAO oDao = new OrderDAO();
		int countOrders = oDao.countOrderByUId(userId);
		Cart cart = (Cart) session.getAttribute("cart");
		
//		CartDAO cartDao = new CartDAO();
//		if (cartDao.isExist(user.getId())) {
//			cartDao.removeCart(userId);
//		}
//
//		session.setAttribute("cart", null);
//		cartDao.close();
		
		oDao.close();
		request.setAttribute("cart", cart);
		request.setAttribute("fullName", fullName);
		request.setAttribute("countOrders", countOrders);
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
	}

}
