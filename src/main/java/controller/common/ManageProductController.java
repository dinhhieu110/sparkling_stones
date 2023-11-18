package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Gallery;
import model.Product;
import model.User;
import util.Template;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import com.google.gson.Gson;

import dao.GalleryDAO;
import dao.ProductDAO;
import dao.UserDAO;

/**
 * Servlet implementation class ManageProductController
 */
@MultipartConfig
public class ManageProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String FOWARD_PAGE = "/main/productmanagement.jsp";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id==null) {
		ProductDAO productdao = new ProductDAO();
		List<Product> list = new ArrayList<Product>();

		int countP = productdao.getTotalProducts();
		int size = 9;
		int endPage = countP / size;
		if (countP % size != 0) {
			endPage++;
		}

		String indexPage = request.getParameter("index");
		if (indexPage == null) {
			indexPage = "1";
		}
		int index = Integer.parseInt(indexPage);
		list = productdao.getProductsEachPage(index);

		request.setAttribute("listP", list);
		request.setAttribute("endP", endPage);
		request.setAttribute("tag", index);
		request.setAttribute("from", "ManageProductController");

		request.getRequestDispatcher(FOWARD_PAGE).forward(request, response);
	}else {
		ProductDAO pDao = new ProductDAO();
		Product product = pDao.getProductByIdForUpdate(id);
		if (product != null) {
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			String productJson = gson.toJson(product);
			out.println(productJson);
	}}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String SUCCESS_FORWARD = request.getContextPath() + "/manage-product";

		String action = request.getParameter("action");
		ProductDAO pDao = new ProductDAO();
		GalleryDAO gDao = new GalleryDAO();
		String foward = "";
		String type="";
		String error ="";
		
		List<String> fileNameList = new ArrayList<String>();
		List<String> fileNameListUpdate = new ArrayList<String>();
		switch (action) {
		case "delete": {
			String id = request.getParameter("myDeleteProductHidden");
			pDao.deleteProduct(id);
			foward = SUCCESS_FORWARD + "?status=SuccessfullyDeleted";
			break;
		}
		case "update": {
			String productId = request.getParameter("myUpdateHidden");
//			String category = request.getParameter("category");
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			int discount = Integer.parseInt(request.getParameter("discount"));
			String description = request.getParameter("description");
			
			// Start xử lí ảnh chính
			 Part filePart = request.getPart("thumbnail"); // Lấy part của file từ request bằng tên thuộc tính
		        
		        String thumbnail = getSubmittedFileName(filePart); // Lấy tên của file
		        
		        thumbnail = "/SparklingStones/assets/img/" +thumbnail;
		    // End xử lí ảnh chính
			
			//Start Xử lí các ảnh con
			List<Part> fileParts = request.getParts().stream().filter(part -> "galerry".equals(part.getName()))
					.collect(Collectors.toList());
			for (Part filePart2 : fileParts) {
				  // Xử lý từng tập tin ở đây, ví dụ: lưu tập tin vào một thư mục, xử lý hình ảnh, v.v.
	            String fileName = Paths.get(filePart2.getSubmittedFileName()).getFileName().toString(); // Tên tập tin
	            fileNameListUpdate.add(fileName);
//	            InputStream fileContent = filePart.getInputStream(); // Dữ liệu tập tin
	            // Thực hiện xử lý với tập tin ở đây
			}	        
				response.getWriter().println("Files processed successfully!");
			//End Xử lí các ảnh con
			
			// Update product and gallery tables
				Product updatedProduct = pDao.getProductById(productId);
				if(updatedProduct != null) {
					pDao.updateProduct(productId, name, price, discount, thumbnail, description);					
					for (String fileName : fileNameListUpdate) {
						fileName = "/SparklingStones/assets/img/"+fileName;
						gDao.updateGallery(productId, fileName);
					}
				} else {
					error ="The product does not exist in database!";
					type="danger";
				}
				foward = SUCCESS_FORWARD + "?status=SuccessfullyUpdated";
				
		}
				break;
		case "add": {
			String category = request.getParameter("category");
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			int discount = Integer.parseInt(request.getParameter("discount"));
			String description = request.getParameter("description");
			//Start Xử lí các ảnh con
			List<Part> fileParts = request.getParts().stream().filter(part -> "galerry".equals(part.getName()))
					.collect(Collectors.toList());
			for (Part filePart : fileParts) {
				  // Xử lý từng tập tin ở đây, ví dụ: lưu tập tin vào một thư mục, xử lý hình ảnh, v.v.
	            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Tên tập tin
	            fileNameList.add(fileName);
//	            InputStream fileContent = filePart.getInputStream(); // Dữ liệu tập tin
	            // Thực hiện xử lý với tập tin ở đây
			}
				// Tiếp tục xử lý khác nếu cần
	        
				response.getWriter().println("Files processed successfully!");
			//End Xử lí các ảnh con
				
			// Start xử lí ảnh chính
				 Part filePart = request.getPart("thumbnail"); // Lấy part của file từ request bằng tên thuộc tính
			        
			        String thumbnail = getSubmittedFileName(filePart); // Lấy tên của file
			        
			        thumbnail = "/SparklingStones/assets/img/" +thumbnail;
			// End xử lí ảnh chính
			
			// Add to product and gallery tables 
			Product product = new Product(category, name, price, discount, thumbnail, description);
			String productId = pDao.addProduct(product);
//			Product newProduct = pDao.getProductById(productId);
			for (String fileName : fileNameList) {
				fileName = "/SparklingStones/assets/img/"+fileName;
				Gallery gallery = new Gallery(fileName, productId);
				gDao.addGallery(gallery);
			}
			foward = SUCCESS_FORWARD + "?status=SuccessfullAdded";
		}
			break;
		}
		pDao.close();
		if (error.equals("") && type.equals("")) {
			response.sendRedirect(foward);
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
	 private String getSubmittedFileName(Part part) {
	        for (String cd : part.getHeader("content-disposition").split(";")) {
	            if (cd.trim().startsWith("filename")) {
	                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
	            }
	        }
	        return null;
	    }

}
