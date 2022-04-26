package pic_shop.com.dao;

import java.sql.SQLException;
import java.util.*;
import java.sql.*;
import pic_shop.com.vo.CategoryVo;

public class CategoryDao implements categoryDaoAble{
	private String list_sql = "SELECT * FROM CATEGORY";
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

	@Override
	public CategoryVo detail(int cate_num) throws ClassNotFoundException, SQLException {
		return null;
	}

	@Override
	public boolean insert(CategoryVo cate) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean update(CategoryVo cate) throws ClassNotFoundException, SQLException {
		return false;
	}

	@Override
	public boolean delete(int cate_num) throws ClassNotFoundException, SQLException {
		return false;
	}

}
