package pic_shop.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import pic_shop.com.vo.PicVo;

public class PicDao implements picDaoAble{
	private String list_sql_All = "Select * from pic";
	private String list_sql = "select p.*, c.name from pic p inner join category c on p.cate_num = c.cate_num ";
	
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
	public PicVo detail(String id) throws ClassNotFoundException, SQLException {
		return null;
	}

	@Override
	public boolean insert(PicVo mem) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean update(PicVo mem) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean delete(String id) throws ClassNotFoundException, SQLException {
		return false;
	}

	/*
	 * public static void main(String[] args) { try { System.out.println(new
	 * PicDao().list(0)); } catch (ClassNotFoundException | SQLException e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); } }
	 */
}
