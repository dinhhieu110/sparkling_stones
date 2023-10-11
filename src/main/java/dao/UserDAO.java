package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DAOService;

public class UserDAO {
	private DAOService dao;
	
	public UserDAO() {
		dao = new DAOService();
	}
    
	// Kiểm tra email đã được đăng ký chưa
    public boolean isExisted(String email) {
    	return true;
    }
}
