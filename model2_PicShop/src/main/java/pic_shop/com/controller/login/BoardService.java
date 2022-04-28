package pic_shop.com.controller.login;

import java.util.ArrayList;
import java.util.List;

public class BoardService implements BoardServiceAble{
	
	BoardDao boardDao = new BoardDao();
	
	@Override
	public List<BoardVo> getList() {
		
		List<BoardVo> boardList = boardDao.selectList();
		
		return boardList;
	}

}
