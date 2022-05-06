package pic_shop.com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pic_shop.com.vo.CommentVo;


public class CommentDao implements commentDaoAble{

	@Override
	public List<CommentVo> list(int page) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentVo detail(int num) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int num) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	public List<CommentVo> commentList() throws SQLException,ClassNotFoundException {
		String commentList_sql = "SELECT * FROM pic_comment";
		List<CommentVo> comment_list = new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		PreparedStatement ps = conn.prepareStatement(commentList_sql);
		ResultSet rs = ps.executeQuery();
		if(rs!=null) {
			while(rs.next()) {
				CommentVo comment = new CommentVo();
				comment.setComment_num(rs.getInt("comment_num"));;
				comment.setTitle(rs.getString("title"));
				comment.setContents(rs.getString("contents"));
				comment.setPost_time(rs.getDate("post_time"));
				comment.setPic_grade(rs.getByte("pic_grade"));
				comment.setPic_num(rs.getInt("pic_num"));;
				comment.setMember_id(rs.getString("member_id"));
				comment.setState(rs.getByte("state"));
				comment_list.add(comment);
			}
		}
		
		return comment_list;
	}
	public List<CommentVo> list(String sortColumn,int order) throws SQLException,ClassNotFoundException{
		List<CommentVo> comment_list = new ArrayList<>();
		Connection conn = SqlConnection.getConnection();
		String sort_query ="";
		if(order == 0) {
			sort_query = "SELECT * FROM pic_comment ORDER BY "+sortColumn+" DESC";
		}else {
			sort_query="SELECT * FROM pic_comment ORDER BY "+sortColumn;
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
				CommentVo comment = new CommentVo();
				comment.setComment_num(rs.getInt("comment_num"));;
				comment.setTitle(rs.getString("title"));
				comment.setContents(rs.getString("contents"));
				if(rs.getString("post_time")!=null) {
					comment.setPost_time(rs.getDate("post_time"));
				}
				comment.setPic_grade(rs.getByte("pic_grade"));
				comment.setPic_num(rs.getInt("pic_num"));;
				comment.setMember_id(rs.getString("member_id"));
				comment.setState(rs.getByte("state"));
				comment_list.add(comment);
			}
		}
		return comment_list;
	}

}
