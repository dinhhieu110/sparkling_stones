package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import model.Product;

public class ProductDAO extends DAOService {

	public ProductDAO() {
		super();
	}
	
	public Product getProductById(String id) {
		String sql = "select * from \"ProductWithImages\" where id = ?";
		List<Object> params = new ArrayList<>();
		params.add(UUID.fromString(id));
		
		ResultSet rs = select(sql, params);
		Product product = null;
		
		try {
    		if (rs.next()) {
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
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
}
