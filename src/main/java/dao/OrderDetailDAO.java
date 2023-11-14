package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import model.Order;
import model.OrderDetail;

public class OrderDetailDAO extends DAOService{
	public OrderDetailDAO() {
		super();
	}
	
	public void addOrderDetail(OrderDetail orderDetail) {
		String sql ="insert into \"Order_Details\" (order_id, product_id, price, quantity) values (?, ?, ?, ?)";
		
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(orderDetail.getOrder_id()));
		params.add(UUID.fromString(orderDetail.getProduct_id()));
		params.add(orderDetail.getPrice());
		params.add(orderDetail.getQuantity());
		update(sql, params);
		
		
	}
}
