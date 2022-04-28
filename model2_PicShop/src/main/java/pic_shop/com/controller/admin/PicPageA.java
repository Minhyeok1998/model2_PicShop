package pic_shop.com.controller.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.PicDao;
import java.util.*;
import pic_shop.com.vo.CategoryVo;
@WebServlet("/admin/picture/list.do")
public class PicPageA extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PicDao picdao = new PicDao();
		List<CategoryVo> cate_list = new ArrayList<>();
		
		try {
			cate_list = picdao.cateList();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		req.setAttribute("cate_list", cate_list);
		req.getRequestDispatcher("./list.jsp").forward(req, resp);
	}
	
}
