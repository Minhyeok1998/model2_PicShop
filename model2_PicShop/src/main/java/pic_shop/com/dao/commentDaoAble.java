package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.List;

import pic_shop.com.vo.CommentVo;
import pic_shop.com.vo.PicVo;

public interface commentDaoAble {
	public List<PicVo> list(int page) throws ClassNotFoundException, SQLException ; 
	public PicVo detail(int num) throws ClassNotFoundException, SQLException ; 
	public boolean insert(PicVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean update(PicVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean delete(int num) throws ClassNotFoundException, SQLException ; 
}
