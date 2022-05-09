package pic_shop.com.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.MemberDao;
import pic_shop.com.vo.MemberVo;
@WebServlet("/user/login.do")
public class Login extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(".././login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
//		System.out.println("login Post 들어왔다");
//		System.out.println("id : "+ id+ "pwd:"+ pwd);
		MemberDao memDao = new MemberDao();
		MemberVo member = new MemberVo();
		try {
			member = memDao.login(id,pwd);
			if(member == null) {
				req.getSession().setAttribute("login_result",false);
				req.getSession().setAttribute("canTLogin", false);
				resp.sendRedirect(req.getContextPath()+"/user/login.do");
			}else {
				req.getSession().setAttribute("login_result", true);
				req.getSession().setAttribute("member", member);
				resp.sendRedirect(req.getContextPath()+"/index.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}
}
