package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.EncryptionService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import dao.UserDAO;

/**
 * Servlet implementation class ManageUserController
 */
public class ManageUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/usermanagement.jsp";

	public ManageUserController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id == null) {
			UserDAO uDao = new UserDAO();
			List<User> listU = new ArrayList<User>();
			int size = 5;
			int countU = uDao.getTotalUser();
			int endPage = (countU / size);
			if (countU % size != 0) {
				endPage++;
			}
			String indexPage = request.getParameter("index");
			if (indexPage == null) {
				indexPage = "1";
			}
			int index = Integer.parseInt(indexPage);
			listU = uDao.getListUsers(index);

			uDao.close();
			request.setAttribute("endP", endPage);
			request.setAttribute("tag", index);
			request.setAttribute("listU", listU);
			request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		} else {
			UserDAO uDao = new UserDAO();
			User user = uDao.getUserById(id);
			if (user != null) {
				PrintWriter out = response.getWriter();
				Gson gson = new Gson();
				String userJson = gson.toJson(user);
				out.println(userJson);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/manage-user";
		// Lấy thông tin từ ADD & EDIT form
		String email = request.getParameter("email");
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String pass = request.getParameter("pass");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");
		String action = request.getParameter("action");
		UserDAO uDao = new UserDAO();
		String foward = "";

		switch (action) {
		case "add": {
			// Check xem email tồn tại chưa
			if (!(uDao.emailIsExist(email))) {
				EncryptionService ecrypt = new EncryptionService();
				pass = ecrypt.encryptMD5(pass);
				uDao.addUser(email, lastName, firstName, pass, address, phone, role);
				foward = SUCCESS_FORWARD + "?status=SuccessfullyAdded";
			} else {
				foward = SUCCESS_FORWARD + "?status=SuccessfullyAdded";

			}
			break;

		}
		case "delete": {
			String id = request.getParameter("myDeleteHidden"); //get ID
			uDao.deleteUser(id);
			foward = SUCCESS_FORWARD + "?status=SuccessfullyRemoved";
			break;
		}

		case "update": {
			String id = request.getParameter("myUpdateHidden"); //get ID
			uDao.updateUser(id, firstName, lastName, address, phone, role);
			foward = SUCCESS_FORWARD + "?status=SuccessfullyUpdated";
			break;

		}

		}
		uDao.close();
		response.sendRedirect(foward);

	}
}
