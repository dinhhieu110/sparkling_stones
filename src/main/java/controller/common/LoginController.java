package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.User;
import util.EncryptionService;
import util.Template;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.CartDAO;
import dao.UserDAO;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/login.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		final String SUCCESS_FORWARD = request.getContextPath();
		final String USER_FOWARD = request.getContextPath();
		final String ADMIN_FOWARD = "admin-home";
		

		String email = request.getParameter("txtEmail").toLowerCase();
		String password = request.getParameter("txtPassword");
		String remember = request.getParameter("chkRemember");
		
		UserDAO dao = new UserDAO();
		User user = dao.getUserByEmail(email);
		String error = "";
		String type = "";
		String forward = SUCCESS_FORWARD;

		if (user != null) {
			if (user.isVerified()) {
				EncryptionService encrypt = new EncryptionService();
				String ecryptPassword = encrypt.encryptMD5(password);
				if (ecryptPassword.equals(user.getPassword())) {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					
					// Lấy cart của user
					CartDAO cartDao = new CartDAO();
					Cart cart = null;
					
					if(!cartDao.isExist(user.getId())) {
						String cartId = cartDao.addCart(user.getId());
						cart = new Cart(cartId);
					} else {
						cart = cartDao.getCartByUserId(user.getId());						
					}
					
					session.setAttribute("cart", cart);
					
					cartDao.close();
					
					// lưu account lên cookie
					if (remember != null) {
						Cookie u = new Cookie("userC", email);
						Cookie p = new Cookie("passC", ecryptPassword);
						u.setMaxAge(60 * 60 * 24 * 30);
						p.setMaxAge(60 * 60 * 24 * 30);
						response.addCookie(p);
						response.addCookie(u);
					}
				} else {
					type = "danger";
					error = "Password is incorrect!";
				}
				if(user.getRole().equals("6d48747d-8781-460e-9b2e-b9dc8c44a6f4")) {
					forward = USER_FOWARD;
				} else {
					forward = ADMIN_FOWARD;
				}
			} else {
				type = "warning";
				error = "Account has not been verified. <a href=\"verify-otp?email=" + email + "&otpTask=OtpRegister"
						+ "\" class=\"alert-link\">Verify here</a>";
			}
		} else {
			type = "danger";
			error = "Email has not been registered!";
		}

		dao.close();
		
		if (error.equals("") && type.equals("")) {
			response.sendRedirect(forward);
		} else {
			// Lấy template thông báo lỗi
			Template template = new Template("template/alert.html");
			Map<String, String> replacements = new HashMap<String, String>();
			replacements.put("type", type);
			replacements.put("content", error);

			String alert = template.getTemplate(replacements);
			request.setAttribute("error", alert);
			doGet(request, response);
		}
	}

}