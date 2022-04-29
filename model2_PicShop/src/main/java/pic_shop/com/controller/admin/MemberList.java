package pic_shop.com.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import pic_shop.com.dao.MemberDao;
import pic_shop.com.vo.MemberVo;

@WebServlet("/admin/mem/list.do")
public class MemberList extends HttpServlet{
	private MemberDao memDao=new MemberDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String page_str=req.getParameter("page");
		String sort_col=(req.getParameter("sortCol")!=null)?req.getParameter("sortCol"):"id";
		int sort_how=(req.getParameter("sortHow")!=null)?Integer.parseInt(req.getParameter("sortHow")):1;
		int page=(page_str!=null)?Integer.parseInt(page_str):1;
		List<MemberVo> mem_list=new ArrayList<>();
		try {
			mem_list=memDao.list(page,sort_col,sort_how);
		} catch (ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		}	
		req.setAttribute("mem_list", mem_list);
		req.getRequestDispatcher("./list.jsp").forward(req, resp);
	}
	
}
