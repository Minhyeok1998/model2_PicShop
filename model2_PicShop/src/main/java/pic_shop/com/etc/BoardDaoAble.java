package pic_shop.com.etc;

import java.sql.SQLException;
import java.util.List;

public interface BoardDaoAble {
	
	public List<BoardVo> list(int page) throws ClassNotFoundException, SQLException;

}
