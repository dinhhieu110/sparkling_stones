package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.Template;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.UserDAO;

/**
 * Servlet implementation class ForgotPassController
 */
public class ForgotPassController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/forgotpassword.jsp";


    public ForgotPassController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/verify-otp";
		String email = request.getParameter("email").toLowerCase();
		
		UserDAO dao = new UserDAO();
		String error = "";
		String type = "";
		String forward = SUCCESS_FORWARD;
		final String askOtpForResetPassword = "OtpResetPassword";

		// Check xem có mail này dưới db không
		if((dao.emailIsExist(email))){
			forward += "?email=" + email+"&otpTask="+askOtpForResetPassword;
			response.sendRedirect(forward);
		}else {
			type = "danger";
			error = "This account does not exist!";
			// Lấy template thông báo lỗi
						Template template = new Template("template/alert.html");
						Map<String, String> replacements = new HashMap<String, String>();
						replacements.put("type", type);
						replacements.put("content", error);

						String alert = template.getTemplate(replacements);
						request.setAttribute("error", alert);
						doGet(request, response);
		}
		dao.close();
	} 


}
