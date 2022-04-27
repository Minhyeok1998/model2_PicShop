package pic_shop.com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.MemberDao;
import pic_shop.com.vo.MemberVo;

@WebServlet("/mem/insert.do")
public class MemberInsert extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("\"insert.do doGet()\"");
		req.getRequestDispatcher("./insert.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MemberVo mem=new MemberVo();
		mem.setId(req.getParameter("id"));
		mem.setPw(req.getParameter("pw"));
		mem.setName(req.getParameter("name"));
		mem.setAddress(req.getParameter("address"));
		mem.setAddress_detail(req.getParameter("address_detail"));
		mem.setEmail(req.getParameter("email"));
		mem.setPhone(req.getParameter("phone"));
		mem.setGrade(Byte.parseByte(req.getParameter("grade")));
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-DD");
		try {
			mem.setBirth(sdf.parse(req.getParameter("birth")));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MemberDao memDao=new MemberDao();
		boolean insert=false;
		
		try {
			insert=memDao.insert(mem);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.getSession().setAttribute("insert", insert);
		if(insert) {
			resp.sendRedirect("./list.do");
		}else {
			resp.sendRedirect("./insert.do");
		}
	}
}
