package pic_shop.com.dao;

import java.util.*;
import java.sql.*;
import pic_shop.com.vo.CategoryVo;
import pic_shop.com.vo.PicVo;

import org.json.*;
public class CategoryDao implements categoryDaoAble{
	private String list_sql = "SELECT * FROM CATEGORY";
	private String detail_sql = "SELECT * FROM CATEGORY WHERE CATE_NUM =?";
	private String update_sql = "Update category set name=?,sub=? where cate_num =?";
	@Override
	public List<CategoryVo> list(int page) throws ClassNotFoundException, SQLException {
		List<CategoryVo> cate_list = new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(list_sql);
		ResultSet rs = ps.executeQuery();
		if(rs != null) {
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
	public List<CategoryVo> list(String sortColumn,int order) throws SQLException,ClassNotFoundException{
		List<CategoryVo> cate_list = new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		String sort_query ="";
		if(order == 0) {
			sort_query = "SELECT * FROM category ORDER BY "+sortColumn+" DESC";
		}else {
			sort_query="SELECT * FROM category ORDER BY "+sortColumn;
		}
		PreparedStatement ps = conn.prepareStatement(sort_query);
		ResultSet rs = ps.executeQuery();
		if(rs != null) {
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

	@Override
	public CategoryVo detail(int cate_num) throws ClassNotFoundException, SQLException {
		CategoryVo cate = new CategoryVo();
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(detail_sql);
		ps.setInt(1, cate_num);
		ResultSet rs = ps.executeQuery();
		if(rs != null) {
			while(rs.next()) {
				cate.setCate_num(rs.getInt("cate_num"));
				cate.setName(rs.getString("name"));
				cate.setSub(rs.getInt("sub"));
			}
		}
		
		
		return cate;
	}

	@Override
	public boolean insert(CategoryVo cate) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean update(CategoryVo cate) throws ClassNotFoundException, SQLException {
		
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(update_sql);
		ps.setString(1, cate.getName());
		ps.setInt(2, cate.getSub());
		ps.setInt(3, cate.getCate_num());
		int update = ps.executeUpdate();
		if(update > 0 )return true;
		return false;
	}

	@Override
	public boolean delete(int cate_num) throws ClassNotFoundException, SQLException {
		return false;
	}
	
	public boolean delete(JSONArray ar)throws ClassNotFoundException,SQLException{
		String delete_multi_sql = "DELETE FROM CATEGORY WHERE cate_num IN";
		String del_num ="(";
		Connection conn = SqlConnection.getConnection();
		for(int i =0; i<ar.length(); i++) {
			del_num+=ar.get(i);
			if(i != ar.length()-1) {
				del_num+=",";
			}
		}
		del_num+=")";
		delete_multi_sql+=del_num;
		PreparedStatement ps = conn.prepareStatement(delete_multi_sql);
		int delete = ps.executeUpdate();
		if(delete>0) {
			return true;
		}
		return false;
	}
	
	

}
