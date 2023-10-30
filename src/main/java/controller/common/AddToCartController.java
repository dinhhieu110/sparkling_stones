package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;
import model.User;

import java.io.IOException;

import dao.CartDAO;
import dao.ProductDAO;

/**
 * Servlet implementation class AddToCartController
 */
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");
		
		if (user != null && cart != null) {
			String productId = request.getParameter("id");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			CartDAO cartDao = new CartDAO();
			
			Item item = cart.getItemByProductId(productId);
			if (item != null) {
				int totalQuan = item.getQuantity() + quantity;
				item.setQuantity(totalQuan);
				cartDao.changeQuantity(item.getId(), totalQuan);
			} else {
				ProductDAO proDao = new ProductDAO();
				String itemId = cartDao.addToCart(cart.getId(), productId, quantity);
				Product product = proDao.getProductById(productId);
				cart.addToCart(new Item(itemId, product, quantity));
				proDao.close();
			}
			
			cartDao.close();
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
