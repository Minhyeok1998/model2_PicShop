package pic_shop.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pic_shop.com.vo.MemberVo;

public class MemberDao implements MemberDaoAble{
	private String list_sql="SELECT * FROM MEMBER";
	@Override
	public List<MemberVo> list(int page) throws ClassNotFoundException, SQLException {
		List<MemberVo> mem_list=new ArrayList<>();
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(list_sql);
		ResultSet rs=ps.executeQuery();
		MemberVo mem;
		while(rs.next()) {
			mem=new MemberVo();
			mem.setId(rs.getString("id"));
			mem.setPw(rs.getString("pw"));
			mem.setName(rs.getString("name"));
			mem.setEmail(rs.getString("email"));
			mem.setPhone(rs.getString("phone"));
			mem.setAddress(rs.getString("address"));
			mem.setAddress_detail(rs.getString("address_detail"));
			mem.setBirth(rs.getDate("birth"));
			mem.setGrade(rs.getByte("grade"));
			mem.setSignup_time(rs.getDate("signup_time"));
			mem_list.add(mem);
			
		}
		return mem_list;
	}
	@Override
	public MemberVo detail(String id) throws ClassNotFoundException, SQLException {
		return null;
	}
	@Override
	public boolean insert(MemberVo mem) throws ClassNotFoundException, SQLException {
		return false;
	}
	@Override
	public boolean update(MemberVo mem) throws ClassNotFoundException, SQLException {
		return false;
	}
	@Override
	public boolean delete(String id) throws ClassNotFoundException, SQLException {
		return false;
	}

}
