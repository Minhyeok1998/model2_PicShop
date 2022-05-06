package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.List;

import pic_shop.com.vo.CommentVo;

public interface commentDaoAble {
	public List<CommentVo> list(int page) throws ClassNotFoundException, SQLException ; 
	public CommentVo detail(int num) throws ClassNotFoundException, SQLException ; 
	public boolean delete(int num) throws ClassNotFoundException, SQLException ; 
}
