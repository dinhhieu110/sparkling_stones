package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import model.Review;

public class ReviewDAO extends DAOService {

	public ReviewDAO() {
		super();
	}

	public List<Review> getReviewsByProductId(String id) {
		String sql = "select r.*, concat(u.first_name, ' ', u.last_name) as name from \"Review\" r join \"User\" u on r.user_id = u.id where product_id = ? order by created_at desc";
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(id));
		
		ResultSet rs = select(sql, params);
		List<Review> list = new ArrayList<Review>();
		
		try {
			while (rs.next()) {
				list.add(new Review(rs.getString("id"), 
									rs.getString("name"),
									rs.getInt("rating"),
									rs.getString("comment"),
									rs.getString("response"),
									rs.getTimestamp("created_at")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
