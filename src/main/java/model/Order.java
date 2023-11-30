package model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Order {
	private String id;
	private String user_id;
	private String fullname;
	private String email;
	private String phone_number;
	private String note;
	private Timestamp order_date;
	private int status;
	private int total_money;
	private String address;
	private List<Item> items;
	
	public Order() {
		super();
	}

	public Order(String user_id, String fullname, String email, String phone_number, String note, Timestamp order_date,
			int status, int total_money, String address) {
		super();
		this.user_id = user_id;
		this.fullname = fullname;
		this.email = email;
		this.phone_number = phone_number;
		this.note = note;
		this.order_date = order_date;
		this.status = status;
		this.total_money = total_money;
		this.address = address;
		items = new ArrayList<>();
	}
	
	public Order(String id, String user_id, String fullname, String phone_number, Timestamp order_date,
			int status, int total_money, String address) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.fullname = fullname;
		this.phone_number = phone_number;
		this.order_date = order_date;
		this.status = status;
		this.total_money = total_money;
		this.address = address;
		items = new ArrayList<>();
	}

	public Order(String id, String user_id, String fullname, String email, String phone_number, String note,
			Timestamp order_date, int status, int total_money, String address) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.fullname = fullname;
		this.email = email;
		this.phone_number = phone_number;
		this.note = note;
		this.order_date = order_date;
		this.status = status;
		this.total_money = total_money;
		this.address = address;
		items = new ArrayList<>();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTotal_money() {
		return total_money;
	}

	public void setTotal_money(int total_money) {
		this.total_money = total_money;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
	
	
	
}
