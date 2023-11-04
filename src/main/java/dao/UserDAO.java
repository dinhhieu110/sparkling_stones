package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
    	String sql = "insert into \"User\" (email, password, first_name, last_name) values (?, ?, ?, ?)";
    	List<Object> params = new ArrayList<>();
    	params.add(email);
    	params.add(password);
    	params.add(firstName);
    	params.add(lastName);
    	
    	update(sql, params);
    }
    
    // Add User - Admin
    public void addUser(String email, String lastName, String firstName, String password, String address, String phone, String role) {
    	String sql = "insert into \"User\" (email, last_name, first_name, password, address, phone, role_id) values (?, ?, ?, ?, ?, ?, ?)";
    	List<Object> params = new ArrayList<Object>();
    	
    	params.add(email);
    	params.add(lastName);
    	params.add(firstName);
    	params.add(password);
    	params.add(address);
    	params.add(phone);
    	params.add(UUID.fromString(role));
    	update(sql, params);
    }
    
    // DeleteUser - Admin
    public void deleteUser(String id) {
    	String sql = "delete from \"User\" where id = ? ";
    	List<Object> params = new ArrayList<Object>();
    	params.add(UUID.fromString(id));
    	update(sql, params);
    }
    
	// Update User - Admin
	public void updateUser (String id, String firstName, String lastName, String address, String phone, String role) {
		String sql = "update \"User\" set first_name = ?, last_name = ?, address = ?,phone = ?, role_id =? where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(firstName);
		params.add(lastName);
		params.add(address);
		params.add(phone);
    	params.add(UUID.fromString(role));
		params.add(UUID.fromString(id));	
		update(sql, params);

	}
    
    public User getUserByEmail(String email) {
    	String sql = "select * from \"User\" where email = ?";
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
		    					rs.getString("address"),
		    					rs.getBoolean("verified"));
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return user;
    }
    
    public User getUserById(String id) {
    	String sql = "select * from \"User\" where id = ?";
    	List<Object> params = new ArrayList<>();
    	params.add(UUID.fromString(id));
    	
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
		    					rs.getString("address"),
		    					rs.getBoolean("verified"));
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	return user;
    }
    
    // Xác nhận tài khoản
    public void verify(String email) {
    	String sql = "update \"User\" set verified = true where email = ?";
    	List<Object> params = new ArrayList<>();
    	params.add(email);
    	
    	update(sql, params);
    }

    // Cập nhật mật khẩu
	public void updatePassword(String email, String newPassword) {
		String sql =  "update \"User\" set password = ? where email = ?";
		List<Object> params = new ArrayList<>();
		params.add(newPassword);
		params.add(email);
		
		update(sql, params);
		
	}
	
	public boolean editProfile(User user) {
		boolean f = false;
		try {
			String sql = "update \"User\"\n" + "set first_name =?,\n" + "last_name=?,\n" + "phone =?,\n" + "address=?\n"
					+ "where email =?";
			List<Object> params = new ArrayList<>();
			params.add(user.getFirstName());
			params.add(user.getLastName());
			params.add(user.getPhone());
			params.add(user.getAddress());
			params.add(user.getEmail());

			update(sql, params);
			/*
			 * Connection con = null; PreparedStatement p = con.prepareStatement(sql);
			 * p.setString(1, user.getFirstName()); p.setString(2, user.getLastName());
			 * p.setString(3, user.getPhone()); p.setString(4, user.getAddress());
			 * p.setString(5, user.getEmail());
			 * 
			 * p.executeUpdate();
			 */

			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int getTotalUser() {
		String sql = "select count(*) from \"User\"";
		
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
	
	public List<User> getListUsers(int index){
		String sql ="select u.*, r.name as rolename from \"User\" u join \"Role\" r on u.role_id = r.id order by id offset ? rows fetch next 5 rows only";
		List<Object> params = new ArrayList<Object>();
		params.add((index-1)*5);
		
		List<User> list = new ArrayList<User>();
		ResultSet rs = select(sql, params);
		try {
			while(rs.next()) {
				list.add(new User(
						rs.getString("id"), 
						rs.getString("email"), 
						rs.getString("password"), 
						rs.getString("first_name"), 
						rs.getString("last_name"), 
						rs.getString("rolename"), 
						rs.getString("phone"), 
						rs.getString("address"), 
						rs.getBoolean("verified")));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
}
