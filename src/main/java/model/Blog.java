package model;

import java.sql.Timestamp;

public class Blog {
	private String id;
	private String thumbnail;
	private String tittle;
	public Timestamp createdAt;
	public Timestamp updatedAt;
	private String user_id;
	private String heading1;
	private String para1;
	private String heading2;
	private String para2;
	private String subthumbnial;
	private String note;

	public Blog(String id, String thumbnail, String tittle, Timestamp createdAt, Timestamp updatedAt, String user_id,
			String heading1, String para1, String heading2, String para2, String subthumbnial, String note) {
		super();
		this.id = id;
		this.thumbnail = thumbnail;
		this.tittle = tittle;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.user_id = user_id;
		this.heading1 = heading1;
		this.para1 = para1;
		this.heading2 = heading2;
		this.para2 = para2;
		this.subthumbnial = subthumbnial;
		this.note = note;
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

	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getHeading1() {
		return heading1;
	}

	public void setHeading1(String heading1) {
		this.heading1 = heading1;
	}

	public String getPara1() {
		return para1;
	}

	public void setPara1(String para1) {
		this.para1 = para1;
	}

	public String getHeading2() {
		return heading2;
	}

	public void setHeading2(String heading2) {
		this.heading2 = heading2;
	}

	public String getPara2() {
		return para2;
	}

	public void setPara2(String para2) {
		this.para2 = para2;
	}

	public String getSubthumbnial() {
		return subthumbnial;
	}

	public void setSubthumbnial(String subthumbnial) {
		this.subthumbnial = subthumbnial;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
