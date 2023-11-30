package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import model.Blog;
import model.Product;

public class BlogDAO extends DAOService {

	public BlogDAO() {
		super();
	}
	
	//lấy tất cả sản phẩm 
	public List<Blog> getAllBlog() {
		String sql = "select * from \"Blog\"";
		ResultSet rs = select(sql);
		
		List<Blog> list = new ArrayList<Blog>();
		
		try {
			while(rs.next()) {
				list.add( new Blog(rs.getString("id"),
						  rs.getString("thumbnail"),
						  rs.getString("title"),
						  rs.getTimestamp("created_at"),
						  rs.getTimestamp("updated_at"),
						  rs.getString("user_id"),
						  rs.getString("heading1"),
						  rs.getString("para1"),
						  rs.getString("heading2"),
						  rs.getString("para2"),
						  rs.getString("subthumbnail"),
						  rs.getString("note")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	public Blog getBlogById(String id) {
		String sql = "select * from \"Blog\" where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(id));
		ResultSet rs = select(sql, params);
		Blog blog = null;
		
		try {
			while (rs.next()) {
    			blog = new Blog(rs.getString("id"),
									  rs.getString("thumbnail"),
									  rs.getString("title"),
									  rs.getTimestamp("created_at"),
									  rs.getTimestamp("updated_at"),
									  rs.getString("user_id"),
									  rs.getString("heading1"),
									  rs.getString("para1"),
									  rs.getString("heading2"),
									  rs.getString("para2"),
									  rs.getString("subthumbnail"),
									  rs.getString("note")
									  );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return blog;
	}
	
	//lấy 5 sản phẩm mới nhất
	public List<Blog> getOtherBlogs() {
		
		String sql = "select * from \"Blog\" order by created_at desc limit 5";
		
		ResultSet rs = select(sql);

		List<Blog> list = new ArrayList<Blog>();
		try {
			while(rs.next()) {
				list.add( new Blog(rs.getString("id"),
						  rs.getString("thumbnail"),
						  rs.getString("title"),
						  rs.getTimestamp("created_at"),
						  rs.getTimestamp("updated_at"),
						  rs.getString("user_id"),
						  rs.getString("heading1"),
						  rs.getString("para1"),
						  rs.getString("heading2"),
						  rs.getString("para2"),
						  rs.getString("subthumbnail"),
						  rs.getString("note")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
