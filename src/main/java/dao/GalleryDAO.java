package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
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
	
	
	public List<Gallery> getListGalleryByProductId(String productId){
		String sql = "select * from \"Gallery\" where product_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(productId));
		ResultSet rs = select(sql, params);
		List<Gallery> listOfGallery = new ArrayList<Gallery>();
		try {
			while(rs.next()) {
				listOfGallery.add(new Gallery(rs.getString("id"), 
											  rs.getString("thumbnail"),
											  rs.getString("product_id")));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return listOfGallery;
	}
	
	public void updateGallery(String productId, List<String> fileNameList, List<Gallery> listOfGallery) {
		for(int i = 0; i < listOfGallery.size(); i++) {		
				String sql= "update \"Gallery\" set thumbnail = ? where id = ?";
				List<Object> params = new ArrayList<Object>();
				params.add(fileNameList.get(i));
				params.add(UUID.fromString(listOfGallery.get(i).getId()));
				update(sql, params);
		}
	}
}
