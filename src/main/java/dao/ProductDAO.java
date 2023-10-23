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

	public List<Product> getNewProducts() {

		String sql = "select * from \"ProductWithImages\" order by created_at desc limit 8";

		ResultSet rs = select(sql);

		List<Product> list = new ArrayList<Product>();
		try {
			while(rs.next()) {
				list.add( new Product(rs.getString("id"),
						  rs.getString("category_id"),
						  rs.getString("title"),
						  rs.getInt("price"), 
						  rs.getInt("discount"),
						  rs.getString("thumbnail"), 
						  rs.getArray("gallery"),
						  rs.getString("description"),
						  rs.getDouble("rating"),
						  rs.getTimestamp("created_at"),
						  rs.getTimestamp("updated_at")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public List<Product> getRecommendedProducts() {
		String sql = "select * from \"ProductWithImages\" order by rating desc limit 4";

		ResultSet rs = select(sql);

		List<Product> list = new ArrayList<Product>();
		try {
			while(rs.next()) {
				list.add( new Product(rs.getString("id"),
						  rs.getString("category_id"),
						  rs.getString("title"),
						  rs.getInt("price"), 
						  rs.getInt("discount"),
						  rs.getString("thumbnail"), 
						  rs.getArray("gallery"),
						  rs.getString("description"),
						  rs.getDouble("rating"),
						  rs.getTimestamp("created_at"),
						  rs.getTimestamp("updated_at")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public int getTotalProducts() {
		String sql = "select count(*) from \"Product\"";

		ResultSet rs = select(sql);

		try {
			while (rs.next()) {
				return rs.getInt("count");
			}
		} catch (Exception e) {
		}
		return 0;
	}

	public List<Product> getProductsEachPage(int index) {

		String sql = "select * from \"ProductWithImages\"\r\n" + "order by id\r\n"
				+ "offset ? rows fetch next 9 rows only;";
		List<Object> params = new ArrayList<Object>();
		params.add((index - 1) * 9);

		ResultSet rs = select(sql, params);

		List<Product> list = new ArrayList<Product>();
		try {
			while (rs.next()) {
				list.add(new Product(rs.getString("id"), rs.getString("category_id"), rs.getString("title"),
						rs.getInt("price"), rs.getInt("discount"), rs.getString("thumbnail"), rs.getArray("gallery"),
						rs.getString("description"), rs.getDouble("rating"), rs.getTimestamp("created_at"),
						rs.getTimestamp("updated_at")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

}
