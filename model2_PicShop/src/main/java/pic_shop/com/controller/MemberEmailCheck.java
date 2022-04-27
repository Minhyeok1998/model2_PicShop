package pic_shop.com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.MemberDao;
import pic_shop.com.vo.MemberVo;

@WebServlet("/user/mem/email_check.do")
public class MemberEmailCheck extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		MemberDao memDao= new MemberDao();
		String email=req.getParameter("email");
		resp.setContentType("json/application; charset=UTF-8");
		MemberVo mem =null;
		try {
			mem=memDao.detail_email(email);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(mem.getPhone()==null) {
			resp.getWriter().append("{ \"email_check\" : true }");
		}else {
			resp.getWriter().append("{ \"email_check\" : false }");
		}

	}
}
