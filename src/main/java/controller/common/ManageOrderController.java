package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.User;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import dao.OrderDAO;

/**
 * Servlet implementation class ManageOrderController
 */
public class ManageOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FORWARD_PAGE ="/main/ordermanagement.jsp";

    public ManageOrderController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user != null) {
			OrderDAO oDao = new OrderDAO();
			int countO = oDao.countOrders();
			int size = 5;
			int endP = (countO / size);
			if((countO % size) != 0) {
				endP++;
			}
			String indexPage = request.getParameter("index");
			if(indexPage == null) {
				indexPage = "1";
			}
			int index = Integer.parseInt(indexPage);
			List<Order> allOrders = oDao.getAllOrders(index);
			oDao.close();
			request.setAttribute("endP", endP);
			request.setAttribute("tag", index);
			request.setAttribute("from", "ManageOrderController");
			request.setAttribute("allOrders", allOrders);
			request.getRequestDispatcher(FORWARD_PAGE).forward(request, response);
		}else {
			request.getRequestDispatcher("/login").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath()+"/manage-order";
		String action = request.getParameter("action");
		String orderId = request.getParameter("orderId");
		int status = Integer.parseInt(request.getParameter("status"));
		OrderDAO oDao = new OrderDAO();
		String forward="";
		switch(action) {
		case "cancel": 
			{
				oDao.AcceptAndDeclineOrder(status, orderId);
				forward = SUCCESS_FORWARD + "?notify=CancelSuccessfully";
				break;
			}
		case "accept":
			{
				oDao.AcceptAndDeclineOrder(status, orderId);
				forward = SUCCESS_FORWARD + "?notify=AcceptSuccessfully";
				break;
			}
		}
		response.sendRedirect(forward);
	}

}
