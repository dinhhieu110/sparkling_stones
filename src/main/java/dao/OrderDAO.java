package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.oracle.wls.shaded.org.apache.xpath.operations.Or;

import model.Order;

public class OrderDAO extends DAOService{
	public OrderDAO() {
		super();
	}
	
	public String addOrder(Order order) {
		String sql ="insert into \"Orders\" (id, user_id, fullname, email, phone_number, note, order_date,status, total_money, address) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		List<Object> params = new ArrayList<Object>();
		UUID orderId = UUID.randomUUID();
		params.add(orderId);
		params.add(UUID.fromString(order.getUser_id()));
		params.add(order.getFullname());
		params.add(order.getEmail());
		params.add(order.getPhone_number());
		params.add(order.getNote());
		params.add(order.getOrder_date());
		params.add(order.getStatus());
		params.add(order.getTotal_money());
		params.add(order.getAddress());
		update(sql, params);
		return orderId.toString();
	}
	
	public Order getOrder() {
		String sql ="select * from \"Orders\" order by id asc limit 1";
		ResultSet rs = select(sql);
		try {
			while(rs.next()) {
				Order order = new Order(rs.getString("id"),
										rs.getString("user_id"), 
										rs.getString("fullname"), 
										rs.getString("email"), 
										rs.getString("phone_number"), 
										rs.getString("note"), 
										rs.getTimestamp("order_date"), 
										rs.getInt("status"), 
										rs.getInt("total_money"),
										rs.getString("address"));
				return order;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public int countOrderByUId(String userId) {
		String sql ="select count(*) from \"Orders\" where user_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(userId));
		ResultSet rs = select(sql, params);
		int countOrders = 0;
		try {
			while(rs.next()) {
				countOrders = rs.getInt("count");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return countOrders;
		
	}
	
	public List<Order> OrdersByUserId(String userId) {
		String sql = "select * from \"Orders\" where user_id = ? ";
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(userId));
		List<Order> listOrders = new ArrayList<Order>();
		ResultSet rs = select(sql, params);
		try {
			while(rs.next()) {
				listOrders.add(new Order(rs.getString("id"), 
										rs.getString("user_id"), 
										rs.getString("fullname"), 
										rs.getString("email"), 
										rs.getString("phone_number"), 
										rs.getString("note"), 
										rs.getTimestamp("order_date"), 
										rs.getInt("status"), 
										rs.getInt("total_money"),
										rs.getString("address")));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return listOrders;
	}
	
	public Order getLatestOrder(String userId) {
		String sql ="select * from \"Orders\" where user_id = ? order by order_date desc limit 1;";
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(userId));
		ResultSet rs = select(sql, params);
		Order order = null;
		try {
			while(rs.next()) {
				order = new Order(rs.getString("id"), 
								  rs.getString("user_id"),
								  rs.getString("fullname"), 
								  rs.getString("email"), 
								  rs.getString("phone_number"), 
								  rs.getString("note"), 
								  rs.getTimestamp("order_date"), 
								  rs.getInt("status"), 
								  rs.getInt("total_money"), 
								  rs.getString("address"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return order;
	}
}	
