package pic_shop.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pic_shop.com.vo.CommentVo;
/*+-------------+--------------+------+-----+-------------------+-------------------+
| Field       | Type         | Null | Key | Default           | Extra             |
+-------------+--------------+------+-----+-------------------+-------------------+
| comment_num | int          | NO   | PRI | NULL              | auto_increment    |
| title       | varchar(255) | YES  |     |                   |                   |
| contents    | varchar(255) | YES  |     |                   |                   |
| post_time   | datetime     | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| pic_grade   | tinyint      | NO   |     | 6                 |                   |
| pic_num     | int          | NO   | MUL | NULL              |                   |
| member_id   | varchar(255) | NO   | MUL | NULL              |                   |
| state       | tinyint      | NO   |     | 0                 |                   |
+-------------+--------------+------+-----+-------------------+-------------------+*/

public class CommentDao implements CommentDaoAble{
	String list_sql="SELECT * FROM PIC_COMMENT WHERE PIC_NUM=?";
	@Override
	public List<CommentVo> list(int page,int pic_num) throws ClassNotFoundException, SQLException {		
		List<CommentVo> com_list=new ArrayList<>();
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(list_sql);
		ps.setInt(1,pic_num);
		ResultSet rs=ps.executeQuery();
		CommentVo com;
		while(rs.next()) {
			com=new CommentVo();
			com.setComment_num(rs.getInt("comment_num"));
			com.setContents(rs.getString("contents"));
			com.setTitle(rs.getString("title"));
			com.setState(rs.getByte("state"));
			com.setPost_time(rs.getDate("post_time"));
			com.setPic_num(rs.getInt("pic_num"));
			com.setPic_grade(rs.getByte("pic_grade"));
			com.setMember_id(rs.getString("member_id"));
			com_list.add(com);
		}
		return com_list;
	}
	@Override
	public CommentVo detail(int comment_num) throws ClassNotFoundException, SQLException {
		return null;
	}

	@Override
	public boolean insert(CommentVo com) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean update(CommentVo com) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean delete(int comment_num) throws ClassNotFoundException, SQLException {
		return false;
	}
<<<<<<< HEAD

	
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
	
	public List<PicVo> list(String sortColumn,int order) throws SQLException,ClassNotFoundException{
		List<PicVo> pic_list = new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		String sort_query ="";
		if(order == 0) {
			sort_query = "SELECT * FROM PIC ORDER BY "+sortColumn+" DESC";
		}else {
			sort_query="SELECT * FROM PIC ORDER BY "+sortColumn;
		}
		PreparedStatement ps = conn.prepareStatement(sort_query);
		/*
		 * PreparedStatement ps =
		 * conn.prepareStatement("SELECT * FROM PIC ORDER BY ? desc"); ps.setString(1,
		 * sortColumn);
		 *이거 왜 안먹힘? 그래서 그냥 보안 신경 안쓰거 구현함*/
		ResultSet rs = ps.executeQuery();
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
=======
>>>>>>> 3317156c741483c490964f090347051d07dfc946

}
