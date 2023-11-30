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

import dao.OrderDAO;
import dao.OrderDetailDAO;

/**
 * Servlet implementation class MyOrderController
 */
public class MyOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FORWARD_PAGE = "/main/myorder.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String orderId = request.getParameter("id");
		if(orderId == null) {
		OrderDAO oDao = new OrderDAO();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
			if(user != null) {
				List<Order> listOrders = oDao.OrdersByUserId(user.getId());
		
				request.setAttribute("userName", user.getFirstName());
				request.setAttribute("listOrders", listOrders);
				request.getRequestDispatcher(FORWARD_PAGE).forward(request, response);
			}else {
				request.getRequestDispatcher("/login").forward(request, response);
			}
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
