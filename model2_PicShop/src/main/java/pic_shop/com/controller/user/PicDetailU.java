package pic_shop.com.controller.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.CommentDao;
import pic_shop.com.dao.PicDao;
import pic_shop.com.vo.CommentVo;
import pic_shop.com.vo.PicVo;

@WebServlet("/user/pic_list/detail.do")
public class PicDetailU extends HttpServlet{
	private PicDao picDao= new PicDao();
	private CommentDao ComDao=new CommentDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//pic_comment의 pic_num은 Pic의 num이다 !!		
		String page_str=req.getParameter("page");
		int page=(page_str!=null)?Integer.parseInt(page_str):1;
		int num=(req.getParameter("num")!=null)?Integer.parseInt(req.getParameter("num")):-1;
		PicVo pic=new PicVo();
		List<CommentVo> com_list=new ArrayList<>();
		try {
			pic=picDao.detail_num(num);
			com_list=ComDao.list(page,num);
		} catch (ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("pic", pic);
		req.setAttribute("com_list", com_list);
		req.getRequestDispatcher("./detail.jsp").forward(req, resp);		
	}
}
