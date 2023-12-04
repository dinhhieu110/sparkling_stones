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
	
	
	public Blog getBlogByIdForUpdate(String id) {
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
	
	public int getTotalBlog() {
		String sql = "select count(*) from \"Blog\" ";
		ResultSet rs = select(sql);
		try {
			while(rs.next()) {
				return rs.getInt("count");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return 0;
	}
	
	public List<Blog> getListBlogs(int index) {
		String sql = "select * from \"Blog\" order by id offset ? rows fetch next 5 rows only";
		List<Object> params = new ArrayList<Object>();
		params.add((index - 1)*5);
		
		List<Blog> list = new ArrayList<Blog>();
		ResultSet rs = select(sql, params);
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
	
	//Add Blog
	public void addBlog(String thumbnail, String tittle, String heading1, String para1, String heading2, String para2, String subthumbnial, String note) {
		String sql = "insert into \"Blog\" (thumbnail, title, heading1, para1,heading2,para2,subthumbnail,note)\r\n"
				+ "values(?,?,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(thumbnail);
		params.add(tittle);
		params.add(heading1);
		params.add(para1);
		params.add(heading2);
		params.add(para2);
		params.add(subthumbnial);
		params.add(note);
    	update(sql, params);
	}
	
	//Delete Blog
	public void deleteBlog(String id) {
		String sql = "delete from \"Blog\" where id= ?";
    	List<Object> params = new ArrayList<Object>();
    	params.add(UUID.fromString(id));
    	update(sql, params);
	}
	
	//Update Blog
	
	public void updateBlog (String id,String thumbnail, String tittle, String heading1, String para1, String heading2, String para2, String subthumbnial, String note ) {
		String sql = "update \"Blog\" set thumbnail = ?, title = ?, heading1= ?, para1 = ?, heading2 = ?, para2 = ?, subthumbnail = ?, note = ?  where id =?\r\n"
				+ "";
		List<Object> params = new ArrayList<Object>();
		params.add(thumbnail);
		params.add(tittle);
		params.add(heading1);
		params.add(para1);
		params.add(heading2);
		params.add(para2);
		params.add(subthumbnial);
		params.add(note);
		params.add(UUID.fromString(id));	
		update(sql, params);

	}
	
	
	
}
