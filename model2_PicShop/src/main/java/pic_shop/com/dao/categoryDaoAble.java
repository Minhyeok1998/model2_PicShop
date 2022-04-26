package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.List;

import pic_shop.com.vo.CategoryVo;

public interface categoryDaoAble {
	public List<CategoryVo> list(int page) throws ClassNotFoundException, SQLException ; 
	public CategoryVo detail(String id) throws ClassNotFoundException, SQLException ; 
	public boolean insert(CategoryVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean update(CategoryVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean delete(String id) throws ClassNotFoundException, SQLException ; 
}
