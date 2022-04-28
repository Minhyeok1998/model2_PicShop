package pic_shop.com.controller.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLogout extends HttpServlet{
	private static final long serialVersuonUID= 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//세션 해제
		req.getSession().invalidate();
		
		//메인페이지로 리다이렉트
		resp.sendRedirect("/main");
	}

}
