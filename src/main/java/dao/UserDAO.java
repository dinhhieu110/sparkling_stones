package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.User;

public class UserDAO extends DAOService{

	public UserDAO() {
		super();
	}
    
	// Kiểm tra email đã được đăng ký chưa
    public boolean emailIsExist(String email) {
    	String sql = "select email from \"User\" where email = ?";
    	List<Object> params  = new ArrayList<>();
    	params.add(email);
    	
    	ResultSet rs = select(sql, params);
    	boolean flag = false;
    	
    	try {
			flag = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return flag;
    }
    
    // Đăng ký user
    public void register(String email, String password, String firstName, String lastName) {
    	String sql = "INSERT INTO \"User\" (email, password, first_name, last_name) values (?, ?, ?, ?)";
    	List<Object> params = new ArrayList<>();
    	params.add(email);
    	params.add(password);
    	params.add(firstName);
    	params.add(lastName);
    	
    	update(sql, params);
    }
    
    public User getUserByEmail(String email) {
    	String sql = "SELECT * FROM \"User\" where email = ?";
    	List<Object> params = new ArrayList<>();
    	params.add(email);
    	
    	ResultSet rs = select(sql, params);
    	User user = null;
    	
    	try {
    		if (rs.next()) {
    			user = new User(rs.getString("id"),
		    					rs.getString("email"),
		    					rs.getString("password"), 
		    					rs.getString("first_name"),
		    					rs.getString("last_name"), 
		    					rs.getString("role_id"),
		    					rs.getString("phone"),
		    					rs.getString("address"));    			
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return user;
    }
}
