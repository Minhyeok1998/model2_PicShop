package pic_shop.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.MemberDao;


@WebServlet("/admin/mem/delete2.do")
public class MemberDelete2 extends HttpServlet{
	MemberDao memDao=new MemberDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		boolean delete=false;
		try {
			delete=memDao.delete(id);
		} catch (ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		}
		if(delete) {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter(); 
			out.println("<script>alert('삭제성공!!!'); location.href='./list.do?page=1'</script>"); 
			out.flush();
						
		}else {
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter(); 
			out.println("<script>alert('삭제실패!!!'); location.href='./list.do?page=1'</script>"); 
			out.flush();
			//resp.sendRedirect("./list.do?page=1");	
		}
	}
}
