package controller.common;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;
import model.User;
import util.Template;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

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
				Product product = proDao.getProductById(productId);
				String itemId = cartDao.addToCart(cart.getId(), productId, quantity);
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Cart cart = (Cart) session.getAttribute("cart");

		if (user != null && cart != null) {
			String productId = request.getParameter("id");
			String action = request.getParameter("action");

			Item item = cart.getItemByProductId(productId);
			if (item != null) {
				CartDAO dao = new CartDAO();
				int quantity;
				switch (action) {
				case "increase": {
					quantity = item.getQuantity() + 1;
					item.setQuantity(quantity);
					dao.changeQuantity(item.getId(), quantity);
					break;
				}
				case "decrease": {
					quantity = item.getQuantity() - 1;
					if (quantity > 0) {
						item.setQuantity(quantity);
						dao.changeQuantity(item.getId(), quantity);
						break;
					}
				}
				case "delete": {
					cart.removeFromCart(item);
					dao.removeFromCart(item.getId());
					break;
				}
				default:
					throw new IllegalArgumentException("Unexpected value: " + action);
				}
				dao.close();

				PrintWriter writer = response.getWriter();
				Template template = new Template("template/cart-item.html");
				String output = "";
				DecimalFormat format = new DecimalFormat("#,###₫");
				for (Item cartItem : cart.getItems()) {
					Product product = cartItem.getProduct();
					Map<String, String> replacements = new HashMap<String, String>();
					replacements.put("id", product.getId());
					replacements.put("thumbnail", product.getThumbnail());
					replacements.put("title", product.getTitle());
					replacements.put("quantity", Integer.toString(cartItem.getQuantity()));
					replacements.put("title", product.getTitle());
					replacements.put("finalPrice", format.format(product.getFinalPrice()));
					replacements.put("totalPrice", format.format(product.getFinalPrice() * cartItem.getQuantity()));
					output += template.getTemplate(replacements);
				}
				String json = output + "|||{\"quantity\": " + cart.getItems().size() + ", \"total\": "
						+ cart.getTotal() + "}"; 
				writer.write(json);
			}
		}
	}

}
