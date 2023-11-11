package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
}	
