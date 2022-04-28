package pic_shop.com.controller.login;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/mem/login/list")
public class BoardList extends HttpServlet{
	private BoardDao boaDao= new BoardDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String page_str=req.getParameter("page");
		int page=(page_str!=null)?Integer.parseInt(page_str):1;
		
		//최종적으로 DB에 있던 List값이 boardList에 전달된다.
		List<BoardVo> boa_List = new ArrayList<BoardVo>();
		
		try {
			boa_List=boaDao.list(page);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//HttpServletRequest req에 속성값을 지정해준다.
		System.out.println(boa_List);
		req.setAttribute("boardList", boa_List);
		req.getRequestDispatcher("./list.jsp").forward(req, resp);
		

	}

}
