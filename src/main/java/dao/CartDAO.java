package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import model.Cart;
import model.Item;
import model.Product;

public class CartDAO extends DAOService {
	
	public CartDAO() {
		super();
	}
	
	public boolean isExist(String userId) {
		String sql = "select 1 from \"Shopping_Session\" where user_id = ?";
		List<Object> params = new ArrayList<>();
		params.add(UUID.fromString(userId));
		
		ResultSet rs = select(sql, params);
		boolean flag = false;
		
		try {
			flag = rs.next();
		}  catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public String addCart(String userId) {
		String sql = "insert into \"Shopping_Session\" (id, user_id) values (?, ?)";
		UUID cartId = UUID.randomUUID();
		List<Object> params = new ArrayList<>();
		params.add(cartId);
		params.add(UUID.fromString(userId));
		
		update(sql, params);
		return cartId.toString();
	}
	
	public void removeCart(String userId) {
		String sql = "delete from \"Shopping_Session\" where user_id = ?";
		List<Object> params = new ArrayList<>();
		params.add(UUID.fromString(userId));		
		update(sql, params);
	}
	
	public Cart getCartByUserId(String id) {
		String sql = "select c.id as item_id, p.*, s.id as session_id, quantity from \"Shopping_Session\" s \n"
				+ "left join \"Cart_Item\" c on s.id = c.session_id\n"
				+ "left join \"ProductWithImages\" p on c.product_id = p.id\n"
				+ "where s.user_id = ?";
		List<Object> params = new ArrayList<>();
		params.add(UUID.fromString(id));
		
		ResultSet rs = select(sql, params);
		Cart cart = null;
		Item item = null;
		Product product = null;
		
		try {
			while (rs.next()) {
				cart = new Cart(rs.getString("session_id"));
				
				do {
					if(rs.getString("item_id") != null) {
						product = new Product(rs.getString("id"),
								  rs.getString("category_id"),
								  rs.getString("title"),
								  rs.getInt("price"), 
								  rs.getInt("discount"),
								  rs.getString("thumbnail"), 
								  rs.getArray("gallery"),
								  rs.getString("description"),
								  rs.getDouble("rating"),
								  rs.getTimestamp("created_at"),
								  rs.getTimestamp("updated_at"));
						item = new Item(rs.getString("item_id"), product, rs.getInt("quantity"));
						cart.addToCart(item);
					}
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cart;
	}
	
	public void changeQuantity(String itemId, int quantity) {
		String sql = "update \"Cart_Item\" set quantity = ? where id = ?";
		List<Object> params = new ArrayList<>();
		params.add(quantity);
		params.add(UUID.fromString(itemId));
		
		update(sql, params);
	}

	public String addToCart(String cartId, String productId, int quantity) {
		String sql = "insert into \"Cart_Item\" (id, session_id, product_id, quantity) values (?, ?, ?, ?)";
		UUID itemId = UUID.randomUUID();
		List<Object> params = new ArrayList<>();
		params.add(itemId);
		params.add(UUID.fromString(cartId));
		params.add(UUID.fromString(productId));
		params.add(quantity);
		
		update(sql, params);
		return itemId.toString();
	}

	public void removeFromCart(String itemId) {
		String sql = "delete from \"Cart_Item\" where id = ?";
		List<Object> params = new ArrayList<>();
		params.add(UUID.fromString(itemId));
		
		update(sql, params);
	}
}
