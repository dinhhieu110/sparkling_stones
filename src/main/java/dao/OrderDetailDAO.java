package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import model.Order;
import model.OrderDetail;
import model.Product;

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
	
	public List<OrderDetail> getListOrderDetails(String orderId){
		String sql ="select orderDetail.* , p.* from \"Order_Details\" orderDetail\r\n"
				+ "left join \"ProductWithImages\" p on orderDetail.product_id = p.id\r\n"
				+ "where order_id = ?";
		List<Object> params = new ArrayList<Object>();
		List<OrderDetail> listOrderDetails= new ArrayList<OrderDetail>();
		params.add(UUID.fromString(orderId));
		ResultSet rs = select(sql, params);
		
		try {
			while(rs.next()) {
				Product product = new Product(rs.getString("product_id"), 
											  rs.getString("category_id"), 
											  rs.getString("title"), 
											  rs.getInt("discount"), 
											  rs.getString("thumbnail"), 
											  rs.getString("description"));
				listOrderDetails.add(new OrderDetail(rs.getString("id"), 
													rs.getString("order_id"), 
													rs.getString("product_id"),
													rs.getInt("price"), 
													rs.getInt("quantity"), 
													product));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return listOrderDetails;
	}
}
