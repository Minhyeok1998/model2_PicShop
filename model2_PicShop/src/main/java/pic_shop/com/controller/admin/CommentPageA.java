package pic_shop.com.controller.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.CommentDao;
import pic_shop.com.vo.CommentVo;
import java.util.*;

@WebServlet("/admin/comment/list.do")
public class CommentPageA extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CommentDao commentdao = new CommentDao();
		List<CommentVo> comment_list = new ArrayList<>();
		
		try {
			comment_list = commentdao.commentList();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("comment_list", comment_list);
		req.getRequestDispatcher("./list.jsp").forward(req, resp);
	}
	
}
