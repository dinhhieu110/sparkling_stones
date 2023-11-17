package model;

import java.sql.Timestamp;
import java.sql.Array;

public class Product {
	private String id;
	private String category;
	private String title;
	private int price;
	private int discount;
	private String thumbnail;
	private Array gallery;
	private String description;
	private double rating;
	public Timestamp createdAt;
	public Timestamp updatedAt;

	
	
	
	public Product(String category, String title, int price, int discount, String thumbnail, String description) {
		super();
		this.category = category;
		this.title = title;
		this.price = price;
		this.discount = discount;
		this.thumbnail = thumbnail;
		this.description = description;
	}

	public Product(String category, String title, int price, int discount, String thumbnail, Array gallery,
			String description, double rating, Timestamp createdAt, Timestamp updatedAt) {
		super();
		this.category = category;
		this.title = title;
		this.price = price;
		this.discount = discount;
		this.thumbnail = thumbnail;
		this.gallery = gallery;
		this.description = description;
		this.rating = rating;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public Product(String id, String category, String title, int price, int discount, String thumbnail, Array gallery,
			String description, double rating, Timestamp createdAt, Timestamp updatedAt) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.price = price;
		this.discount = discount;
		this.thumbnail = thumbnail;
		this.gallery = gallery;
		this.description = description;
		this.rating = rating;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	public int getFinalPrice() {
		if (discount > 0) {
			return discount;
		}
		return price;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Array getGallery() {
		return gallery;
	}

	public void setGallery(Array gallery) {
		this.gallery = gallery;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createAt) {
		this.createdAt = createAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updateAt) {
		this.updatedAt = updateAt;
	}

}