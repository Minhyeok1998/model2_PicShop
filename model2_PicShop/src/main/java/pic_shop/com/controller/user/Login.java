package pic_shop.com.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.MemberDao;

@WebServlet("/user/login.do")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("login Post 들어왔다");
		MemberDao memDao = new MemberDao();
		boolean login_result = false;
		try {
			login_result = memDao.login(id,pwd);
			System.out.println("login_result : "+ login_result);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		int grade = 0;
		if(login_result) {
			req.getSession().setAttribute("id", id);
			try {
				grade = memDao.getGrade(id);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			req.getSession().setAttribute("grade",grade);
		}else {
			req.getSession().setAttribute("id", "없는 아이디");
		}
		
		resp.sendRedirect(req.getContextPath()+"/user_header_nav.jsp");
	}
}
