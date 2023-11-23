package controller.common;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import config.Config;
import dao.CartDAO;
import dao.ItemDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Order;
import model.OrderDetail;
import model.User;

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
		if (user != null) {
			request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/check-out";
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		UserDAO uDao = new UserDAO();
		String forward = "";
		if (user != null && cart != null) {
			String action = request.getParameter("action");
			String userId = user.getId();
			String fullName = user.getLastName() + " " + user.getFirstName();
			String email = user.getEmail();
			String phone = user.getPhone();
			String note = request.getParameter("note");
			String address = user.getAddress();
			Timestamp currentDate = new Timestamp(System.currentTimeMillis());
			int total = 0;
			switch (action) {
			case "confirmAddress": {
				String newAddress = request.getParameter("address");
				String newPhone = request.getParameter("phone");
				user.setAddress(newAddress);
				user.setPhone(newPhone);
				forward = SUCCESS_FORWARD + "?state=temp";
				break;
			}
			case "checkOut": {
				int status = Integer.parseInt(request.getParameter("status"));
				for (Item cartItem : cart.getItems()) {
					total += cartItem.getQuantity() * cartItem.getProduct().getDiscount();
				}

				Order order = new Order(userId, fullName, email, phone, note, currentDate, status, total, address);
				OrderDAO oDao = new OrderDAO();
				String orderId = oDao.addOrder(order);

				for (Item cartItem : cart.getItems()) {
					OrderDetail orderDetail = new OrderDetail(orderId, cartItem.getProduct().getId(),
							cartItem.getProduct().getDiscount() * cartItem.getQuantity(), cartItem.getQuantity());
					OrderDetailDAO oDetailDAO = new OrderDetailDAO();
					oDetailDAO.addOrderDetail(orderDetail);
				}
				CartDAO cartDao = new CartDAO();
				cartDao.removeCart(user.getId());
				String cartId = cartDao.addCart(user.getId());
				cart = new Cart(cartId);
				session.setAttribute("cart", cart); 
				forward = SUCCESS_FORWARD;

				 String vnp_Version = "2.1.0";
			        String vnp_Command = "pay";
			        String orderType = "other";
			        
			        String vnp_TxnRef = Config.getRandomNumber(8);
			        String vnp_IpAddr = Config.getIpAddress(request);

			        String vnp_TmnCode = Config.vnp_TmnCode;
			        long amount = total * 100L;
			        
			        Map<String, String> vnp_Params = new HashMap<>();
			        vnp_Params.put("vnp_Version", vnp_Version);
			        vnp_Params.put("vnp_Command", vnp_Command);
			        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
			        vnp_Params.put("vnp_Amount", String.valueOf((amount)));
			        vnp_Params.put("vnp_CurrCode", "VND");
			        vnp_Params.put("vnp_BankCode", "NCB");
			        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
			        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
			        vnp_Params.put("vnp_OrderType", orderType);

			        String locate = request.getParameter("language");
			        vnp_Params.put("vnp_Locale", "vn");
			        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
			        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

			        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
			        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			        String vnp_CreateDate = formatter.format(cld.getTime());
			        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
			        
			        cld.add(Calendar.MINUTE, 15);
			        String vnp_ExpireDate = formatter.format(cld.getTime());
			        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
			        
			        List fieldNames = new ArrayList(vnp_Params.keySet());
			        Collections.sort(fieldNames);
			        StringBuilder hashData = new StringBuilder();
			        StringBuilder query = new StringBuilder();
			        Iterator itr = fieldNames.iterator();
			        while (itr.hasNext()) {
			            String fieldName = (String) itr.next();
			            String fieldValue = (String) vnp_Params.get(fieldName);
			            if ((fieldValue != null) && (fieldValue.length() > 0)) {
			                //Build hash data
			                hashData.append(fieldName);
			                hashData.append('=');
			                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
			                //Build query
			                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
			                query.append('=');
			                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
			                if (itr.hasNext()) {
			                    query.append('&');
			                    hashData.append('&');
			                }
			            }
			        }
			        String queryUrl = query.toString();
			        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
			        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
			        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
			        response.sendRedirect(paymentUrl);
//			        com.google.gson.JsonObject job = new JsonObject();
//			        job.addProperty("code", "00");
//			        job.addProperty("message", "success");
//			        job.addProperty("data", paymentUrl);
//			        Gson gson = new Gson();
//			        response.getWriter().write(gson.toJson(job));
		    }
			}
		}
		uDao.close();
//		response.sendRedirect(forward);
	}
}
