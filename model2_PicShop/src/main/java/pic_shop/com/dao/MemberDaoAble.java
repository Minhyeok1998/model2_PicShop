package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.List;

import pic_shop.com.vo.MemberVo;

public interface MemberDaoAble {

	public List<MemberVo> list(int page) throws ClassNotFoundException, SQLException ; 
	public MemberVo detail(String id) throws ClassNotFoundException, SQLException ; 
	public boolean insert(MemberVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean update(MemberVo mem) throws ClassNotFoundException, SQLException ; 
	public boolean delete(String id) throws ClassNotFoundException, SQLException ; 
}
