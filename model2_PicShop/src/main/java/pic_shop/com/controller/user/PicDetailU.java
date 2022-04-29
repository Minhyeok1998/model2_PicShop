package pic_shop.com.controller.user;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.PicDao;
import pic_shop.com.vo.PicVo;

@WebServlet("/user/pic_list/detail.do")
public class PicDetailU extends HttpServlet{
	private PicDao picDao= new PicDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num=(req.getParameter("num")!=null)?Integer.parseInt(req.getParameter("num")):-1;
		PicVo pic=new PicVo();
		try {
			pic=picDao.detail_num(num);
		} catch (ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("pic", pic);
		req.getRequestDispatcher("./detail.jsp").forward(req, resp);		
	}
}
