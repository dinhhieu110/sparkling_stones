package model;

public class Gallery {
	private String id;
	private String thumbnail;
	private String productId;
	
	
	public Gallery(String thumbnail, String productId) {
		super();
		this.thumbnail = thumbnail;
		this.productId = productId;
	}

	public Gallery(String id, String thumbnail, String productId) {
		super();
		this.id = id;
		this.thumbnail = thumbnail;
		this.productId = productId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	
}
