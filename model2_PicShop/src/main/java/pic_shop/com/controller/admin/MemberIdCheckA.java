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



@WebServlet("/admin/mem/id_check.do")
public class MemberIdCheckA extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		MemberDao memDao=new MemberDao();	
		resp.setContentType("json/application; charset=UTF-8");
		MemberVo mem=null;
		try {
			mem=memDao.detail_id(id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		if(mem.getId()==null) {
			resp.getWriter().append("{\"id_check\": true}");			
		}else {
			resp.getWriter().append("{\"id_check\": false}");
		}
		
	}
}
