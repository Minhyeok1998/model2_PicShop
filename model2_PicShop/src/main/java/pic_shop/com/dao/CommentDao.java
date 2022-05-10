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

}
