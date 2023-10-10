package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import context.DbContext;

public class DAOService {
	private Connection con;
	private PreparedStatement stm;
	private ResultSet rs;

	public DAOService() {
		con = null;
		stm = null;
		rs = null;
	}

	//	Select không điều kiện
	public ResultSet select(String sql) {
		try {
			con = DbContext.getConnection();
			if (con != null) {
				stm = con.prepareStatement(sql);
				rs = stm.executeQuery();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			close();
		}

		return rs;
	}

	// Select có điều kiện
	public ResultSet select(String sql, List<Object> params) {
		try {
			con = DbContext.getConnection();
			if (con != null) {
				stm = con.prepareStatement(sql);

				if (params != null) {
					int length = params.size();

					for (int i = 0; i < length; i++) {
						stm.setObject(i + 1, params.get(i));
					}
				}

				rs = stm.executeQuery();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			close();
		}
		return rs;
	}

	// Update và insert không điều kiện
	public void update(String sql) {
		try {
			con = DbContext.getConnection();
			if (con != null) {
				stm = con.prepareStatement(sql);
				stm.execute();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	//Update và insert có điều kiện
	public void update(String sql, List<Object> params) {
		try {
			con = DbContext.getConnection();
			if (con != null) {
				stm = con.prepareStatement(sql);
				
				if (params != null) {
					int length = params.size();

					for (int i = 0; i < length; i++) {
						stm.setObject(i + 1, params.get(i));
					}
				}
				
				stm.execute();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	// Đóng kết nối và tài nguyên
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stm != null)
				stm.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
