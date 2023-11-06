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

	// 8 new products
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
	
	// 4 new products
		public List<Product> getOtherProducts() {

			String sql = "select * from \"ProductWithImages\" order by created_at desc limit 4";

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
	
	// Lấy tổng số sản phẩm
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
	
	// Lấy số sản phẩm sau search
	public int getNumSearchProducts(String nameSearch) {

		String sql = "select count (*) from \"ProductWithImages\" where lower(title) like ?";
		
		List<Object> params = new ArrayList<Object>();
		params.add(nameSearch);
		ResultSet rs = select(sql, params);

		try {
			while(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<Product> searchByName(String nameSearch, int index) {

		String sql = "select * from \r\n"
				+ "(select row_number() over (order by id asc ) as rowNo, *\r\n"
				+ "from \"ProductWithImages\" where lower(title) like ?) as  x\r\n"
				+ "where rowNo between ?*9-8 and ?*9 ;";
		
		List<Object> params = new ArrayList<Object>();
		params.add(nameSearch);
		params.add(index);
		params.add(index);

		ResultSet rs = select(sql, params);

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
	
	// Xóa sản phẩm
		public void deleteProduct(String id) {

			String sql = "delete from \"Product\"\n"
					+ "where id=?";
			List<Object> params = new ArrayList<Object>();
			params.add(UUID.fromString(id));
			update(sql, params);
		}

}
