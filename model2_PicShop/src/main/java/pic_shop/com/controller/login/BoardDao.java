package pic_shop.com.controller.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pic_shop.com.dao.SqlConnection;

public class BoardDao implements BoardDaoAble {

	private String list_sql="SELECT * FROM BOARD";
	
	@Override
	public List<BoardVo> list(int page) throws ClassNotFoundException, SQLException {
		List<BoardVo> board_list= new ArrayList<BoardVo>();
		Connection conn=SqlConnection.getConnection();
		PreparedStatement ps=conn.prepareStatement(list_sql);
		ResultSet rs=ps.executeQuery();
		BoardVo board;
		while(rs.next()) {
			board = new BoardVo();
			board.setNum(rs.getInt("num"));
			board.setMember_id(rs.getString("member_id"));
			board.setTitle(rs.getString("title"));
			board.setContents(rs.getString("contents"));
			board.setPost_time(rs.getDate("post_time"));
			board.setState(rs.getByte("state"));
			board_list.add(board);
			
			
		}
		return board_list;
	}


}
