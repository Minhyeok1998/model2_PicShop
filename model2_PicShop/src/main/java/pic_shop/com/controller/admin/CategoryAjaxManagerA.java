package pic_shop.com.controller.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

import java.util.*;
import pic_shop.com.dao.CategoryDao;
import pic_shop.com.vo.CategoryVo;
@WebServlet("/admin/category/ajax.do")
public class CategoryAjaxManagerA extends HttpServlet{
	CategoryDao catedao = new CategoryDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CategoryVo> cate_list = new ArrayList<>();
		if(req.getParameter("cate_num")!= null) {
			//modify 할때 구현할 위치
		}else {
			try {
				cate_list = catedao.list(0);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		resp.setContentType("application/json; charset=UTF-8");
		resp.getWriter().append(cate_list.toString());
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BufferedReader br = req.getReader();
		StringBuffer sb = new StringBuffer();
		String line = "";
		while((line=br.readLine())!= null) {
			sb.append(line);
		}
		JSONObject json = new JSONObject(sb.toString());
		JSONArray ar =json.getJSONArray("del_list");
		boolean delete = false;
		try {
			delete = catedao.delete(ar);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		resp.setContentType("application/json; charset=UTF-8");
		resp.getWriter().append("{\"delete\":"+delete+"}");
	}
}
