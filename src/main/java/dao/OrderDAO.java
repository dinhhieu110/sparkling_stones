package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
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
		String sql = "select * from \"Orders\" where user_id = ? order by order_date desc";
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
	
	public List<Order> getAllOrders(int index){
		List<Order> allOrders = new ArrayList<Order>();
		String sql="select * from \"Orders\" order by order_date desc offset ? rows fetch next 5 rows only";
		List<Object> params = new ArrayList<Object>();
		params.add((index - 1) * 5);
		ResultSet rs = select(sql, params);
		try {
			while(rs.next()) {
				allOrders.add(new Order(rs.getString("id"), 
										rs.getString("user_id"), 
										rs.getString("fullname"), 
										rs.getString("phone_number"), 		
										rs.getTimestamp("order_date"), 
										rs.getInt("status"),
										rs.getInt("total_money"),
										rs.getString("address")
										));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return allOrders;
	}
	
	public void AcceptAndDeclineOrder(int status, String orderId) {
		String sql = "update \"Orders\" set status = ? where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(status);
		params.add(UUID.fromString(orderId));
		update(sql, params);
	}
	
	public int countOrders() {
		String sql ="select count(*) from \"Orders\"";
		ResultSet rs = select(sql);
		int num = 0;
		try {
			while(rs.next()) {
				num = rs.getInt("count");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return num;
}	
	public long getTotaIncome() {
		String sql ="select sum(total_money) from \"Orders\"";
		ResultSet rs = select(sql);
		long income = 0L;
		try {
			while(rs.next()) {
				income = rs.getLong("sum");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return income;
	}
	
	public Map<String, Long> getDailyIncomeInMonth(){
		String sql ="with\r\n"
				+ "  DateReference as (\r\n"
				+ "    select\r\n"
				+ "      generate_series(\r\n"
				+ "        date_trunc('MONTH', current_date)::date,\r\n"
				+ "        (\r\n"
				+ "          date_trunc('MONTH', current_date) + interval '1 month - 1 day'\r\n"
				+ "        )::date,\r\n"
				+ "        interval '1 day'\r\n"
				+ "      )::date as date_reference\r\n"
				+ "  )\r\n"
				+ "select\r\n"
				+ "  extract(\r\n"
				+ "    day\r\n"
				+ "    from\r\n"
				+ "      d.date_reference\r\n"
				+ "  ) as label,\r\n"
				+ "  coalesce(sum(o.total_money), 0) as value\r\n"
				+ "from\r\n"
				+ "  DateReference d\r\n"
				+ "  left join \"Orders\" o on d.date_reference = o.order_date::date\r\n"
				+ "where\r\n"
				+ "  extract(\r\n"
				+ "    month\r\n"
				+ "    from\r\n"
				+ "      d.date_reference\r\n"
				+ "  ) = extract(\r\n"
				+ "    month\r\n"
				+ "    from\r\n"
				+ "      current_date\r\n"
				+ "  )\r\n"
				+ "  and extract(\r\n"
				+ "    year\r\n"
				+ "    from\r\n"
				+ "      d.date_reference\r\n"
				+ "  ) = extract(\r\n"
				+ "    year\r\n"
				+ "    from\r\n"
				+ "      current_date\r\n"
				+ "  )\r\n"
				+ "group by\r\n"
				+ "  d.date_reference\r\n"
				+ "order by\r\n"
				+ "  d.date_reference;\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "";
		Map<String, Long> chart = new LinkedHashMap<String, Long>();
		ResultSet rs = select(sql);
		try {
			while(rs.next()) {
				chart.put(rs.getString("label"), rs.getLong("value"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return chart;
	}
}
