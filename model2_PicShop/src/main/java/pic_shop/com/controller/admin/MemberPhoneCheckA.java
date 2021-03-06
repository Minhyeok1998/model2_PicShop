package pic_shop.com.controller.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.MemberDao;
import pic_shop.com.vo.MemberVo;

@WebServlet("/admin/mem/phone_check.do")
public class MemberPhoneCheckA extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		MemberDao memDao= new MemberDao();
		String phone=req.getParameter("phone");
		resp.setContentType("json/application; charset=UTF-8");
		MemberVo mem =null;
		try {
			mem=memDao.detail_phone(phone);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		if(mem.getPhone()==null) {
			resp.getWriter().append("{ \"phone_check\" : true }");
		}else {
			resp.getWriter().append("{ \"phone_check\" : false }");
		}
		
	}
}
