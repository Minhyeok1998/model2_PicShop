package pic_shop.com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.vo.MemberVo;
import pic_shop.com.dao.MemberDao;

@WebServlet("/user/mem/id_check.do")
public class MemberIdCheck extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		MemberDao memDao= new MemberDao();
		String id=req.getParameter("id");
		resp.setContentType("json/application; charset=UTF-8");
		MemberVo mem =null;
		
		try {
			mem=memDao.detail_id(id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(mem.getId()==null) {			
			resp.getWriter().append("{ \"id_check\" : true }");
			req.setAttribute("mem", mem);
		}else {
			resp.getWriter().append("{ \"id_check\" : false }");
		}
	}
}
