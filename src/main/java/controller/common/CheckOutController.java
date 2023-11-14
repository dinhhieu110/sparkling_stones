package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

import com.google.gson.Gson;
import com.oracle.wls.shaded.org.apache.xpath.operations.Or;

import dao.CartDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
import dao.UserDAO;

public class CheckOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/cart.jsp";

	public CheckOutController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user != null) {
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		} else {
		response.sendRedirect(request.getContextPath()+ "/login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/check-out";
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		UserDAO uDao = new UserDAO();
		String forward="";
		if (user != null && cart != null) {
			String action = request.getParameter("action");
			String userId = user.getId();
			String fullName = user.getLastName() +" "+ user.getFirstName();
			String email = user.getEmail();
			String phone = user.getPhone();
			String note = request.getParameter("note");
			String address = user.getAddress();
			Timestamp currentDate = new Timestamp(System.currentTimeMillis());
			int totalMoney = 0;
			switch (action) {
			case "confirmAddress": {
				String newAddress = request.getParameter("address");
				String newPhone = request.getParameter("phone");
				user.setAddress(newAddress);
				user.setPhone(newPhone);
				forward = SUCCESS_FORWARD+"?state=temp";
				break;
			}
			case "checkOut": {
				int status = Integer.parseInt(request.getParameter("status"));
				for (Item cartItem : cart.getItems()) {
					totalMoney += cartItem.getQuantity() * cartItem.getProduct().getDiscount();
				}

				Order order = new Order(userId, fullName, email, phone, note, currentDate, status, totalMoney, address);
				OrderDAO oDao = new OrderDAO();
				String orderId = oDao.addOrder(order);

				for (Item cartItem : cart.getItems()) {
					OrderDetail orderDetail = new OrderDetail(orderId, cartItem.getProduct().getId(),
							cartItem.getProduct().getDiscount()* cartItem.getQuantity(), cartItem.getQuantity());
					OrderDetailDAO oDetailDAO = new OrderDetailDAO();
					oDetailDAO.addOrderDetail(orderDetail);
				}
				CartDAO cartDao = new CartDAO();
				if(cartDao.isExist(user.getId())) {
					cartDao.removeCart(userId);
				}
				
				session.setAttribute("cart", null);
				cartDao.close();
				forward = SUCCESS_FORWARD;
				break;
			}
			}
		}
		uDao.close();
		response.sendRedirect(forward);
	}
}
