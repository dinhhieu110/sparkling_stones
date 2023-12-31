package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private String id;
	private List<Item> items;
	
	public Cart() {
		items = new ArrayList<>();
	}
	
	public Cart(String id) {
		super();
		this.id = id;
		items = new ArrayList<>();
	}

	public Cart(List<Item> items) {
		super();
		this.items = items;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
	
	public Item getItemByProductId(String id) {
		for (Item item : items) {
			if (item.getProduct().getId().equals(id)) {
				return item;
			}
		}
		return null;
	}

	public void addToCart(Item item) {
		items.add(item);
	}
	
	public void removeFromCart(Item item) {
		if (items.contains(item))
			items.remove(item);
	}
	
	public int getTotal() {
		int total = 0;
		for (Item item : items) {
			total += item.getQuantity() * item.getProduct().getFinalPrice();
		}
		return total;
	}
	
}
