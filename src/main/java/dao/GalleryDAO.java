package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
}
