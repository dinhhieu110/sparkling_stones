package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.google.common.base.Objects;

import model.Gallery;
import model.Product;

public class GalleryDAO extends DAOService{
	
	public GalleryDAO() {
		super();
	}
	
	public void addGallery(Gallery gallery) {
		String sql = "insert into \"Gallery\" (thumbnail, product_id) values(?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(gallery.getThumbnail());
		params.add(UUID.fromString(gallery.getProductId()));
		
		
		update(sql, params);
	}
	
	public void updateGallery(String productId, String thumbnail) {
		String sql= "update \"Gallery\" set thumbnail = ? where product_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(thumbnail);
		params.add(UUID.fromString(productId));
	
		update(sql, params);
	}
}
