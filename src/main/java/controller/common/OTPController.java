package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.EmailService;
import util.OTPService;
import util.Template;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.UserDAO;

/**
 * Servlet implementation class OTPController
 */
public class OTPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FORWARD_PAGE = "/main/otp.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OTPController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (request.getParameter("email") != null) {
			doPut(request, response);
		} else {
			request.getRequestDispatcher(FORWARD_PAGE).forward(request, response);			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/login";

		// Lấy mã OTP từ form
		String[] numbers = request.getParameterValues("number");
		String otpString = "";
		for (String number : numbers) {
			otpString += number;
		}
		int otp = Integer.parseInt(otpString);

		UserDAO dao = new UserDAO();
		String error = "";
		String type = "";
		
		// Validate the OTP
		if (otp >= 0) {
			HttpSession session = request.getSession();
			OTPService otpService = (OTPService) session.getAttribute("otpService");
			User user = (User) session.getAttribute("user");

			String email = user.getEmail();
			int serverOtp = otpService.getOtp(email);
			if (serverOtp > 0) {
				if (otp == serverOtp) {
					otpService.clearOTP(email);
					dao.verify(email);
				} else {
					error = "OTP is incorrect";
					type = "danger";
				}
			} else {
				error = "OTP has expired. <a href=\"verify-otp?email="+ email +"\" class=\"alert-link\">Resend OTP</a>";
				type = "warning";
			}
		} else {
			error = "OTP is invalid";
			type = "danger";
		}

		dao.close();
		if (error.equals("") && type.equals("")) {
			response.sendRedirect(SUCCESS_FORWARD);
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
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		final String SUCCESS_FORWARD = request.getContextPath() + "/verify-otp";
		final String FAIL_FORWARD = request.getContextPath() + "/register";
		
		String email = request.getParameter("email");
		
		UserDAO dao = new UserDAO();
		User user = dao.getUserByEmail(email);

		String forward = FAIL_FORWARD;
		
		if (user != null) {
			OTPService otpService = new OTPService();
			int otp = otpService.generateOTP(email);
			
			// Generate The Template to send OTP
			Template template = new Template("template/mail-otp.html");
			Map<String, String> replacements = new HashMap<String, String>();
			replacements.put("user", email);
			replacements.put("otpnum", String.valueOf(otp));
			String message = template.getTemplate(replacements);
			
			EmailService emailService = new EmailService();
			emailService.send(email, "[Spakling Stones] OTP Verification", message);
			
			HttpSession session = request.getSession();
			session.setAttribute("otpService", otpService);
			session.setAttribute("user", user);		
						
			forward = SUCCESS_FORWARD;
		}
		
		dao.close();
		response.sendRedirect(forward);
	}

}
