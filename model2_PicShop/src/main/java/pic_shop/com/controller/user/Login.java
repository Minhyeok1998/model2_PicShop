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
		System.out.println("login Post ���Դ�");
		System.out.println("id : "+ id+ "pwd:"+ pwd);
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
			System.out.println("grade : "+ grade);
			req.getSession().setAttribute("grade",grade);
		}else {
			req.getSession().setAttribute("id", "�α��� �� �� ����!(ID �Ǵ� Password�� Ȯ���Ͽ� �ּ���!)");
		}
		resp.sendRedirect(req.getContextPath()+"/index.jsp");
	}
}
