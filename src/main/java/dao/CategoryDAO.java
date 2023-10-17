package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Category;

public class CategoryDAO extends DAOService{
	public CategoryDAO() {
		super();
	}
	
	public List<Category> getCategories(){
		
		String sql = "select * from \"Category\"";
		
		ResultSet rs = select(sql);
		
		List<Category> list = new ArrayList<Category>();
		try {
			while(rs.next()) {
				list.add(new Category(rs.getString("id"), rs.getString("name"), rs.getString("icon")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
