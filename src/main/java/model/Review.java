package model;

import java.sql.Timestamp;

public class Review {
	private String id;
	private String name;
	private int rating;
	private String comment;
	private String response;
	private Timestamp createdAt;

	public Review(String id, String name, int rating, String comment, String response, Timestamp createdAt) {
		super();
		this.id = id;
		this.name = name;
		this.rating = rating;
		this.comment = comment;
		this.response = response;
		this.createdAt = createdAt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getResponse() {
		return response;
	}

	public void setRespone(String response) {
		this.response = response;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

}
