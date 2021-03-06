package pic_shop.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.JSONArray;

import pic_shop.com.vo.MemberVo;
public class MemberDao implements MemberDaoAble{

	
	private String list_sql="SELECT * FROM MEMBER";
	private String update_sql="UPDATE MEMBER SET "
			+ " pw=?,"
			+ " phone=?,"
			+ " email=?,"
			+ " name=?,"
			+ " address=?,"
			+ " address_detail=?,"
			+ " birth=?"
			+ " WHERE id=?";

	private String delete_sql="DELETE FROM MEMBER WHERE ID=?";
	private String insert_sql="INSERT INTO MEMBER(id,email,phone,pw,name,address,address_detail,grade,birth) VALUES (?,?,?,?,?,?,?,?,?)";
	private String detail_sql_id="SELECT * FROM MEMBER WHERE iD=?";
	private String detail_sql_phone="SELECT * FROM MEMBER WHERE PHONE=?";
	private String detail_sql_email="SELECT * FROM MEMBER WHERE EMAIL=?";
	

	/*
	 * @Override public List<MemberVo> list(int page) throws ClassNotFoundException,
	 * SQLException { // TODO Auto-generated method stub return null; }
	 */

	@Override
	public MemberVo detail_id(String id) throws ClassNotFoundException, SQLException {
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(detail_sql_id);
		ps.setString(1, id);
		ResultSet rs=ps.executeQuery();
		MemberVo mem=new MemberVo();
		while(rs.next()) {
			mem.setId(rs.getString("id"));
			mem.setName(rs.getString("name"));
			mem.setAddress(rs.getString("address"));
			mem.setAddress_detail(rs.getString("address_detail"));
			mem.setEmail(rs.getString("email"));
			mem.setPhone(rs.getString("phone"));
			mem.setPw(rs.getString("pw"));
			mem.setBirth(rs.getDate("birth"));
			mem.setSignup_time(rs.getDate("signup_time"));
			mem.setGrade(rs.getByte("grade"));		
		}
		return mem;
	}

	@Override
	public MemberVo detail_phone(String phone) throws ClassNotFoundException, SQLException {

		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(detail_sql_phone);
		ps.setString(1, phone);
		ResultSet rs=ps.executeQuery();
		MemberVo mem=new MemberVo();
		while(rs.next()) {
			mem.setId(rs.getString("id"));
			mem.setName(rs.getString("name"));
			mem.setAddress(rs.getString("address"));
			mem.setAddress_detail(rs.getString("address_detail"));
			mem.setEmail(rs.getString("email"));
			mem.setPhone(rs.getString("phone"));
			mem.setPw(rs.getString("pw"));
			mem.setBirth(rs.getDate("birth"));
			mem.setSignup_time(rs.getDate("signup_time"));
			mem.setGrade(rs.getByte("grade"));		
		}
		return mem;
	}

	@Override
	public MemberVo detail_email(String email) throws ClassNotFoundException, SQLException {

		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(detail_sql_email);
		ps.setString(1, email);
		ResultSet rs=ps.executeQuery();
		MemberVo mem=new MemberVo();
		while(rs.next()) {
			mem.setId(rs.getString("id"));
			mem.setName(rs.getString("name"));
			mem.setAddress(rs.getString("address"));
			mem.setAddress_detail(rs.getString("address_detail"));
			mem.setEmail(rs.getString("email"));
			mem.setPhone(rs.getString("phone"));
			mem.setPw(rs.getString("pw"));
			mem.setBirth(rs.getDate("birth"));
			mem.setSignup_time(rs.getDate("signup_time"));
			mem.setGrade(rs.getByte("grade"));		
		}
		return mem;
	}

	@Override
	public boolean insert(MemberVo mem) throws ClassNotFoundException, SQLException {
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(insert_sql);
		ps.setString(1, mem.getId());
		ps.setString(2, mem.getEmail());
		ps.setString(3, mem.getPhone());
		ps.setString(4, mem.getPw());
		ps.setString(5, mem.getName());
		ps.setString(6, mem.getAddress());
		ps.setString(7, mem.getAddress_detail());
		ps.setByte(8, mem.getGrade());
		ps.setString(9, new SimpleDateFormat("yyy-mm-DD").format(mem.getBirth()));
		int insert=ps.executeUpdate();
		if(insert>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean update(MemberVo mem) throws ClassNotFoundException, SQLException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-DD");
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(update_sql);
		ps.setString(1, mem.getPw());
		ps.setString(2, mem.getPhone());
		ps.setString(3, mem.getEmail());
		ps.setString(4, mem.getName());
		ps.setString(5, mem.getAddress());
		ps.setString(6, mem.getAddress_detail());
		ps.setString(7, sdf.format(mem.getBirth()));
		ps.setString(8, mem.getId());
		int update=ps.executeUpdate();
		if(update>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(String id) throws ClassNotFoundException, SQLException {
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(delete_sql);
		ps.setString(1, id);
		int delete=ps.executeUpdate();
		if(delete>0) {
			return true;
		}else{
			return false;
		}
	}

	
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
	
	public List<MemberVo> list(int page,String sortCol, int sortHow) throws ClassNotFoundException, SQLException {
		List<MemberVo> mem_list=new ArrayList<>();
		Connection conn=SqlConnection.getConnection();
		String list_sort_sql=list_sql+" ORDER BY "+sortCol+((sortHow==1)?" ASC":" DESC");
		
		PreparedStatement ps=conn.prepareStatement(list_sort_sql);
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
	
<<<<<<< HEAD
	public MemberVo login(String id, String pwd) throws SQLException,ClassNotFoundException {
		String check_member_sql = "SELECT count(*) from member where id=? and pw=?";
		String login_sql = "SELECT * from member where id=? and pw=?";
=======
	
	
	public boolean login(String id, String pwd) throws SQLException,ClassNotFoundException {
		
>>>>>>> 3317156c741483c490964f090347051d07dfc946
		Connection conn  =SqlConnection.getConnection();
		PreparedStatement check_ps = conn.prepareStatement(check_member_sql);
		PreparedStatement ps = conn.prepareStatement(login_sql);
		check_ps.setString(1, id);
		check_ps.setString(2, pwd);
		ps.setString(1, id);
		ps.setString(2, pwd);
		ResultSet checkRs = check_ps.executeQuery();
		int count = 0;
			while(checkRs.next()) {
				count = checkRs.getInt("count(*)");
			}

		
		if(count == 0) {
			return null;
		}else {
			MemberVo member = new MemberVo();
			ResultSet rs = ps.executeQuery();
			
				while(rs.next()) {
//					private String id;
//					private String pw;
//					private String phone;
//					private String email;
//					private String name;
//					private String address;
//					private String address_detail;
//					private Date signup_time;
//					private Date birth;
//					private byte grade;
					member.setId(rs.getString("id"));
					member.setGrade(rs.getByte("grade"));
				}
				return member;
		}
		
		
		
	}
	
<<<<<<< HEAD
//	public int getGrade(String id) throws SQLException,ClassNotFoundException{
//		int grade = 0;
//		String grade_sql = "SELECT grade FROM MEMBER WHERE ID=?";
//		Connection conn = SqlConnection.getConnection();
//		PreparedStatement ps = conn.prepareStatement(grade_sql);
//		ps.setString(1, id);
//		ResultSet rs = ps.executeQuery();
//		if(rs!=null) {
//			while(rs.next()) {
//				grade = rs.getInt("grade");
//			}
//		}
//		return grade;
//	}
=======
	public int getGrade(String id) throws SQLException,ClassNotFoundException{
		int grade = 0;
		String grade_sql = "SELECT grade FROM MEMBER WHERE ID=?";
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(grade_sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs!=null) {
			while(rs.next()) {
				grade = rs.getInt("grade");
			}
		}
		return grade;
	}

	//???????????????
	public boolean delete_jsonArr(JSONArray ar) throws ClassNotFoundException,SQLException{
		String query = "delete from member where id in ";
		String where_query ="(";
		for(int i = 0; i<ar.length(); i++) {
			where_query+="'"+String.valueOf(ar.get(i))+"'";
			if(i != ar.length()-1) {
				where_query +=",";
			}
		}
		where_query+=")";
		query += where_query;
		System.out.println(query);
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		int delete = ps.executeUpdate();
		if(delete >0) {
			return true;
		}
		return false;
	}
>>>>>>> 3317156c741483c490964f090347051d07dfc946
}
