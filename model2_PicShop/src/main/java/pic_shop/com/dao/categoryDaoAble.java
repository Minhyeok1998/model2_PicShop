package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.List;

import pic_shop.com.vo.CategoryVo;

public interface categoryDaoAble {
	public List<CategoryVo> list(int page) throws ClassNotFoundException, SQLException ; 
	public CategoryVo detail(int cate_num) throws ClassNotFoundException, SQLException ; 
	public boolean insert(CategoryVo cate) throws ClassNotFoundException, SQLException ; 
	public boolean update(CategoryVo cate) throws ClassNotFoundException, SQLException ; 
	public boolean delete(int cate_num) throws ClassNotFoundException, SQLException ; 
}
