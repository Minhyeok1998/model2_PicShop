package pic_shop.com.controller;

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



@WebServlet("/admin/member/modify.do")
public class MemberModify extends HttpServlet{
	private MemberDao memDao=new MemberDao();
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		MemberVo mem=new MemberVo();
		try {
			mem=memDao.detail(id);
		} catch (ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("mem", mem);
		req.getRequestDispatcher("./modify.jsp").forward(req, resp);		
	}
}
	
