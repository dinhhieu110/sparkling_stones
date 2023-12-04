package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.User;
import util.EncryptionService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import dao.BlogDAO;
import dao.UserDAO;

/**
 * Servlet implementation class ManageBlogController
 */
public class ManageBlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/blogmanagement.jsp";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageBlogController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id == null) {
			BlogDAO bDao = new BlogDAO();
			List<Blog> listB = new ArrayList<Blog>();
			int size = 5;
			int countU = bDao.getTotalBlog();
			int endPage = (countU / size);
			if (countU % size != 0) {
				endPage++;
			}
			String indexPage = request.getParameter("index");
			if (indexPage == null) {
				indexPage = "1";
			}
			int index = Integer.parseInt(indexPage);
			listB = bDao.getListBlogs(index);

			bDao.close();
			request.setAttribute("endP", endPage);
			request.setAttribute("tag", index);
			request.setAttribute("listB", listB);
			request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
		} else {
			BlogDAO bDao = new BlogDAO();
			Blog blog = bDao.getBlogByIdForUpdate(id);
			if (blog != null) {
				PrintWriter out = response.getWriter();
				Gson gson = new Gson();
				String blogJson = gson.toJson(blog);
				out.println(blogJson);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/manage-blog";
		// Lấy thông tin từ ADD & EDIT form
		String thumbnail = request.getParameter("thumbnail");
		thumbnail = "/SparklingStones/assets/img/" + thumbnail; 
		String tittle = request.getParameter("tittle");
		String heading1 = request.getParameter("heading1");
		String para1 = request.getParameter("para1");
		String heading2 = request.getParameter("heading2");
		String para2 = request.getParameter("para2");
		String subthumbnial = request.getParameter("subthumbnial");
		subthumbnial = "/SparklingStones/assets/img/" + subthumbnial; 
		String note = request.getParameter("note");
		String action = request.getParameter("action");
		BlogDAO bDao = new BlogDAO();
		String foward = "";
		
		switch (action) {
		
		case "add": { // Check xem email tồn tại chưa if
			bDao.addBlog(thumbnail, tittle, heading1, para1, heading2, para2, subthumbnial, note);
			foward = SUCCESS_FORWARD + "?status=SuccessfullyAdded";
			break;
		  
		  }
		 
		case "delete": {
			String id = request.getParameter("myDeleteBlogHidden");
			bDao.deleteBlog(id);
			foward = SUCCESS_FORWARD + "?status=SuccessfullyDeleted";
			break;
		}

		case "update": {
			String id = request.getParameter("myUpdateHidden"); //get ID
			bDao.updateBlog(id, thumbnail, tittle, heading1, para1, heading2, para2, subthumbnial, note);
			foward = SUCCESS_FORWARD + "?status=SuccessfullyUpdated";
			break;

		}

		}
		bDao.close();
		response.sendRedirect(foward);
	}

}
