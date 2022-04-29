package pic_shop.com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import pic_shop.com.vo.CategoryVo;
import pic_shop.com.vo.PicVo;
import org.json.*;
public class PicDao implements picDaoAble{
	private String list_sql_All = "Select * from pic";
	private String list_sql = "select p.*, c.name from pic p inner join category c on p.cate_num = c.cate_num ";
	private String detail_sql_num="select * from pic where num=?";
	public List<PicVo> list() throws ClassNotFoundException,SQLException{
		List<PicVo> pic_list= new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(list_sql);
		ResultSet rs = ps.executeQuery();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		if(rs!=null) {
			while(rs.next()) {
				PicVo pic = new PicVo();
				pic.setNum(rs.getInt("num"));
				pic.setName(rs.getString("name"));
				pic.setTitle(rs.getString("title"));
				pic.setCount(rs.getInt("count"));
				pic.setPrice(rs.getInt("price"));
				pic.setFrame(rs.getString("frame"));
				pic.setMain_img(rs.getString("main_img"));
				pic.setImg_comment(rs.getString("img_comment"));
				pic.setPic_num(rs.getString("pic_num"));
				pic.setMember_id(rs.getString("member_id"));
				pic.setCate_name(rs.getString("c.name"));
			
				pic.setPost_time(rs.getDate("post_time"));
				pic.setSale_time(rs.getDate("sale_time"));
					//pic.setSale_end_time(sdf.parse(rs.getString("sale_end_time")));
				if(rs.getString("sale_end_time")!=null) {
					pic.setSale_end_time(rs.getDate("sale_end_time"));
				}
				
				pic.setState(rs.getByte("state"));
				pic.setCate_num(rs.getInt("cate_num"));
				pic_list.add(pic);
			}
		}
		
		return pic_list;
	}
	@Override
	public List<PicVo> list(int page) throws ClassNotFoundException, SQLException {
		List<PicVo> pic_list= new ArrayList<>();
		int limit_count = (page != 0)?9*page:page;
		list_sql = list_sql.concat("limit "+limit_count+", 9");
		System.out.println("list_sql :" + list_sql);
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(list_sql);
		ResultSet rs = ps.executeQuery();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(rs!=null) {
			while(rs.next()) {
				PicVo pic = new PicVo();
				pic.setNum(rs.getInt("num"));
				pic.setName(rs.getString("name"));
				pic.setTitle(rs.getString("title"));
				pic.setCount(rs.getInt("count"));
				pic.setPrice(rs.getInt("price"));
				pic.setFrame(rs.getString("frame"));
				pic.setMain_img(rs.getString("main_img"));
				pic.setImg_comment(rs.getString("img_comment"));
				pic.setPic_num(rs.getString("pic_num"));
				pic.setMember_id(rs.getString("member_id"));
				pic.setCate_name(rs.getString("c.name"));
				try {
					pic.setPost_time(sdf.parse(rs.getString("post_time")));
					pic.setSale_time(sdf.parse(rs.getString("sale_time")));
					//pic.setSale_end_time(sdf.parse(rs.getString("sale_end_time")));
					if(rs.getString("sale_end_time")!=null) {
						pic.setSale_end_time(sdf.parse(rs.getString("sale_end_time")));
					}
				} catch (ParseException | SQLException e) {
					e.printStackTrace();
				}
				pic.setState(rs.getByte("state"));
				pic.setCate_num(rs.getInt("cate_num"));
				pic_list.add(pic);
			}
		}
		
		return pic_list;
	}

	@Override
	public PicVo detail(int num) throws ClassNotFoundException, SQLException {
		PicVo picture = new PicVo();
		String detail_query = "SELECT * FROM PIC WHERE NUM=?";
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(detail_query);
		ps.setInt(1, num);
		ResultSet rs = ps.executeQuery();
		if(rs!=null) {
			while(rs.next()) {
				picture.setNum(rs.getInt("num"));
				picture.setName(rs.getString("name"));
				picture.setTitle(rs.getString("title"));
				picture.setCount(rs.getInt("count"));
				picture.setPrice(rs.getInt("price"));
				picture.setFrame(rs.getString("frame"));
				picture.setCate_num(rs.getInt("cate_num"));
				picture.setMain_img(rs.getString("main_img"));
				picture.setImg_comment(rs.getString("img_comment"));
				picture.setPic_num(rs.getString("pic_num"));
				picture.setMember_id(rs.getString("member_id"));
				picture.setPost_time(rs.getDate("post_time"));
				picture.setSale_time(rs.getDate("sale_time"));
				picture.setSale_end_time(rs.getDate("sale_end_time"));
			}
		}
		return picture;
	}
	

	public PicVo detail_num(int num) throws ClassNotFoundException, SQLException {
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps= null;
		if(num==-1) {
			ps=conn.prepareStatement("select * from pic order by rand() limit 1");
		}else {
			ps=conn.prepareStatement(detail_sql_num);
			ps.setInt(1, num);
		}
		ResultSet rs=ps.executeQuery();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		PicVo pic = new PicVo();
		while(rs.next()) {
			pic.setNum(rs.getInt("num"));
			pic.setName(rs.getString("name"));
			pic.setTitle(rs.getString("title"));
			pic.setCount(rs.getInt("count"));
			pic.setPrice(rs.getInt("price"));
			pic.setFrame(rs.getString("frame"));
			pic.setMain_img(rs.getString("main_img"));
			pic.setImg_comment(rs.getString("img_comment"));
			pic.setPic_num(rs.getString("pic_num"));
			pic.setMember_id(rs.getString("member_id"));
			//pic.setCate_name(rs.getString("c.name"));
			try {
				pic.setPost_time(sdf.parse(rs.getString("post_time")));
				pic.setSale_time(sdf.parse(rs.getString("sale_time")));
				if(rs.getString("sale_end_time")!=null) {
					pic.setSale_end_time(sdf.parse(rs.getString("sale_end_time")));
				}
			} catch (ParseException | SQLException e) {
				e.printStackTrace();
			}
			pic.setState(rs.getByte("state"));
			pic.setCate_num(rs.getInt("cate_num"));
		}
		return pic;
	}

	@Override
	public boolean insert(PicVo mem) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean update(PicVo pic) throws ClassNotFoundException, SQLException {
		String update_sql = "update pic set member_id =?,count=?,cate_num =?,title=?,post_time=?,img_comment=?,price=?,sale_end_time=?,pic_num=?,name=?,main_img=?,state=?,sale_time=?,frame=? where num=?";
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(update_sql);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ps.setString(1, pic.getMember_id());
		ps.setInt(2, pic.getCount());
		ps.setInt(3,pic.getCate_num());
		ps.setString(4, pic.getTitle());
		ps.setString(5,  sdf.format(pic.getPost_time()));
		ps.setString(6,pic.getImg_comment());
		ps.setInt(7, pic.getPrice());
		ps.setString(8,sdf.format(pic.getPost_time()));
		ps.setString(9, pic.getPic_num());
		ps.setString(10, pic.getName());
		ps.setString(11, pic.getMain_img());
		ps.setInt(12, pic.getState());
		ps.setString(13,sdf.format(pic.getPost_time()));
		ps.setString(14, pic.getFrame());
		ps.setInt(15, pic.getNum());
		int update = ps.executeUpdate();
		if(update >0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delete(int num) throws ClassNotFoundException, SQLException {
		return false;
	}
	
	public boolean delete(JSONArray ar) throws ClassNotFoundException,SQLException{
		String query = "delete from pic where num in";
		String where_query ="(";
		for(int i = 0; i<ar.length(); i++) {
			where_query+=String.valueOf(ar.get(i));
			if(i != ar.length()-1) {
				where_query +=",";
			}
		}
		
		where_query+=")";
		query += where_query;
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(query);
		int delete = ps.executeUpdate();
		if(delete >0) {
			return true;
		}
		return false;
	}
	
	public List<CategoryVo> cateList() throws SQLException,ClassNotFoundException {
		String cateList_sql = "SELECT * FROM CATEGORY";
		List<CategoryVo> cate_list = new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(cateList_sql);
		ResultSet rs = ps.executeQuery();
		if(rs!=null) {
			while(rs.next()) {
				CategoryVo cate = new CategoryVo();
				cate.setCate_num(rs.getInt("cate_num"));
				cate.setName(rs.getString("name"));
				cate.setSub(rs.getInt("sub"));
				cate_list.add(cate);
			}
		}
		
		return cate_list;
	}

	/*
	 * public static void main(String[] args) { try { System.out.println(new
	 * PicDao().list(0)); } catch (ClassNotFoundException | SQLException e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); } }
	 */
}
