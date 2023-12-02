package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import com.google.gson.Gson;

import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;

/**
 * Servlet implementation class AdminHomeController
 */
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/adminhome.jsp";

    public AdminHomeController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO uDao = new UserDAO();
		int totalUser = uDao.getTotalUser();
		ProductDAO pDao = new ProductDAO();
		int totalProduct = pDao.getTotalProducts();
		long totalSpend = pDao.getTotalSpend();
		OrderDAO oDao = new OrderDAO();
		long income = oDao.getTotaIncome();
		oDao.close();
		uDao.close();
		request.setAttribute("totalSpend", totalSpend);
		request.setAttribute("income", income);
		request.setAttribute("totalUser", totalUser);
		request.setAttribute("totalProduct", totalProduct);
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDAO oDao = new OrderDAO();
		Map<String, Long> chart = oDao.getDailyIncomeInMonth();
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		out.println(gson.toJson(chart));
	}

}
