package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ProductDAO extends DAOService {
	public ProductDAO() {
		super();
	}
	
	public List<Product> getNewProducts(){
		
		String sql ="select * from \"ProductWithImages\" order by created_at desc limit 8";
		
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
}
