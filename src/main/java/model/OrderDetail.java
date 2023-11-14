package model;

public class OrderDetail {
	private String id;
	private String order_id;
	private String product_id;
	private int price;
	private int quantity;
	public OrderDetail() {
		super();
	}
	
	
	
	public OrderDetail(String order_id, String product_id, int price, int quantity) {
		super();
		this.order_id = order_id;
		this.product_id = product_id;
		this.price = price;
		this.quantity = quantity;
	}



	public OrderDetail(String id, String order_id, String product_id, int price, int quantity) {
		super();
		this.id = id;
		this.order_id = order_id;
		this.product_id = product_id;
		this.price = price;
		this.quantity = quantity;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", order_id=" + order_id + ", product_id=" + product_id + ", price=" + price
				+ ", quantity=" + quantity + "]";
	}
	
	
}
