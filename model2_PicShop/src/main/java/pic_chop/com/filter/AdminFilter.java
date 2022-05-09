package pic_chop.com.filter;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import javax.servlet.*;
import pic_shop.com.vo.MemberVo;

@WebFilter("/admin/*")
public class AdminFilter implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) {
		
		/*<Admin Filter ��ȹ>
		 * 1.Login�� �Ǿ� ���� ������ ���Դٸ�? LoginPage �� �̵�
		 * 2.Login �Ǿ����� ������ ������ ���Դٸ�? index.jsp �� �̵�*/
		 HttpServletRequest request = (HttpServletRequest)req;
		 HttpServletResponse response =(HttpServletResponse) resp;
		 HttpSession session = request.getSession();
		 Object login_result = session.getAttribute("login_result");
		 try {
			 
			 if(login_result != null && (boolean)login_result) {
				 MemberVo member = (MemberVo)session.getAttribute("member");
				 if(member != null&&member.getGrade() != 1) {
					 request.getSession().setAttribute("adminGradeExp", true);
					 response.sendRedirect(request.getContextPath()+"/index.jsp");
				 }else {
					 chain.doFilter(req, resp);
				 }
			 }else {
				 request.getSession().setAttribute("LoginExp", true);
				 response.sendRedirect(request.getContextPath()+"/login.jsp");
			 }
		 }catch(IOException e) {
			 e.printStackTrace();
		 } catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	

}
