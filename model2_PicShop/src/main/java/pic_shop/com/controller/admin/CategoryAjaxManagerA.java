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
import pic_shop.com.vo.PicVo;
@WebServlet("/admin/category/ajax.do")
public class CategoryAjaxManagerA extends HttpServlet{
	CategoryDao catedao = new CategoryDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CategoryVo> cate_list = new ArrayList<>();
		resp.setContentType("application/json; charset=UTF-8");
		if(req.getParameter("sort")!=null) {
			try {
				
				cate_list = catedao.list(req.getParameter("sort"),Integer.parseInt(req.getParameter("order")));
			} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			resp.getWriter().append(cate_list.toString());
		}else {
			
			if(req.getParameter("cate_num")!= null) {
				int cate_num = Integer.parseInt(req.getParameter("cate_num"));
				CategoryVo cate = new CategoryVo();
				try {
					cate = catedao.detail(cate_num);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				
				resp.getWriter().append(cate.toString());
				
			}else {
				try {
					cate_list = catedao.list(0);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				resp.setContentType("application/json; charset=UTF-8");
				resp.getWriter().append(cate_list.toString());
			}
		}
		
		
		
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
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CategoryDao catedao = new CategoryDao();
		BufferedReader br = req.getReader();
		StringBuffer sb = new StringBuffer();
		String line="";
		while((line = br.readLine())!=null) {
			sb.append(line);
		}
		
		JSONObject json = new JSONObject(sb.toString());
		CategoryVo cate = new CategoryVo();
		cate.setCate_num(json.getInt("cate_num"));
		cate.setName(json.getString("name"));
		cate.setSub(json.getInt("sub"));
		boolean update = false;
		try {
			update = catedao.update(cate);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		resp.setContentType("application/json; charset=UTF-8");
		resp.getWriter().append("{\"update\": "+update+"}");
	}
}
