package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ItemDAO extends DAOService {
	
	public ItemDAO() {
		super(); }
		
	public void removeAllItemsByCartId(String cartId) {
		String sql ="delete from \"Cart_Item\" where session_id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(UUID.fromString(cartId));
		
		update(sql, params);
	}
}
