package pic_shop.com.controller.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import pic_shop.com.vo.CategoryVo;
import pic_shop.com.dao.CategoryDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/service/category/list.do")
public class CategoryListU extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryDao catedao = new CategoryDao();
		int page = 1;
		resp.setCharacterEncoding("UTF-8");
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
		ArrayList<CategoryVo> cate_list = new ArrayList<>();
		try {
			cate_list = (ArrayList<CategoryVo>) catedao.list(page);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		resp.getWriter().append(cate_list.toString());
	}
}
