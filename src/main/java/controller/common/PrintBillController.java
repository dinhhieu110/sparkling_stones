package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import dao.CartDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;

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
		String orderId = request.getParameter("id");
		if(orderId == null) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		long amount = Long.parseLong(request.getParameter("vnp_Amount"));
		String fullName = user.getLastName()+ " " + user.getFirstName();
		String userId = user.getId();
		OrderDAO oDao = new OrderDAO();
		int countOrders = oDao.countOrderByUId(userId);
		Order order = oDao.getLatestOrder(userId);
		
//		CartDAO cartDao = new CartDAO();
//		if (cartDao.isExist(user.getId())) {
//			cartDao.removeCart(userId);
//		}
//
//		session.setAttribute("cart", null);
//		cartDao.close();
		
		oDao.close();
		request.setAttribute("order", order);
		request.setAttribute("user", user);
		request.setAttribute("countOrders", countOrders);
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		} else {
			OrderDetailDAO odtDao = new OrderDetailDAO();
			List<OrderDetail> listOrderDetails = odtDao.getListOrderDetails(orderId);
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String listOrderDetailsJson = gson.toJson(listOrderDetails);
			out.println(listOrderDetailsJson);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
	}

}
