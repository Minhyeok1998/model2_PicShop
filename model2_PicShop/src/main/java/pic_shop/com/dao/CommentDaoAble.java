package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.List;

import pic_shop.com.vo.CommentVo;
import pic_shop.com.vo.PicVo;

public interface CommentDaoAble {
	public List<CommentVo> list(int page, int pic_num) throws ClassNotFoundException, SQLException ; 
	public CommentVo detail(int comment_num) throws ClassNotFoundException, SQLException ; 
	public boolean insert(CommentVo com) throws ClassNotFoundException, SQLException ; 
	public boolean update(CommentVo com) throws ClassNotFoundException, SQLException ; 
	public boolean delete(int comment_num) throws ClassNotFoundException, SQLException ; 
}
