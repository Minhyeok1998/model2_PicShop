package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.List;

import pic_shop.com.vo.itemVo;

public interface itemDaoAble {
	public List<itemVo> list(int page) throws ClassNotFoundException, SQLException ; 
	public itemVo detail(String id) throws ClassNotFoundException, SQLException ; 
	public boolean insert(itemVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean update(itemVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean delete(String id) throws ClassNotFoundException, SQLException ; 
}
