package pic_shop.com.controller.admin;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.PicDao;
import pic_shop.com.vo.CategoryVo;
import pic_shop.com.vo.PicVo;
import java.util.*;
import org.json.*;
@WebServlet("/admin/picture/ajax.do")
public class PicAjaxManagerA extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json; charset=UTF-8");
		PicDao picdao = new PicDao();
		if(req.getParameter("num") == null) {
			
			ArrayList<PicVo> pic_list = new ArrayList<PicVo>();
		
			
			try {
				pic_list = (ArrayList<PicVo>) picdao.list();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			resp.getWriter().append(pic_list.toString());
		}else {
			int num = Integer.parseInt(req.getParameter("num"));
			PicVo picture = new PicVo();
			try {
				picture = picdao.detail(num);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			resp.getWriter().append(picture.toString());
		}
		
		
		
		
		
	}
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PicDao picdao = new PicDao();
		resp.setContentType("application/json; charset=UTF-8");
		BufferedReader br = req.getReader();
		StringBuffer sb = new StringBuffer();
		String line ="";
		while((line = br.readLine())!= null) {
			sb.append(line);
		}
		System.out.println(sb.toString());
		JSONObject json = new JSONObject(sb.toString());
		JSONArray delete_list = json.getJSONArray("delete_list");
		System.out.println(delete_list.toString());
		boolean delete = false;
		try {
			delete =picdao.delete(delete_list);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		resp.getWriter().append("{\"delete\" : "+delete+"}");
		
	}
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PicDao picdao = new PicDao();
		BufferedReader br = req.getReader();
		StringBuffer sb = new StringBuffer();
		String line ="";
		while((line=br.readLine())!=null) {
			sb.append(line);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		JSONObject json = new JSONObject(sb.toString());
		PicVo picture = new PicVo();
		picture.setMember_id(json.getString("member_id"));
		picture.setNum(json.getInt("num"));
		picture.setCount(json.getInt("count"));
		picture.setCate_num(json.getInt("cate_num"));
		picture.setTitle(json.getString("title"));
		picture.setImg_comment(json.getString("img_comment"));
		picture.setPrice(json.getInt("price"));
		picture.setPic_num(json.getString("pic_num"));
		picture.setName(json.getString("name"));
		picture.setMain_img(json.getString("main_img"));
		picture.setState(Byte.parseByte(json.getString("state")));
		picture.setFrame(json.getString("frame"));
		
		
		try {
			picture.setPost_time(sdf.parse(json.getString("post_time")));
			if(json.getString("sale_end_time").equals(""))
				picture.setSale_end_time(sdf.parse("2050-12-31"));
			else
				picture.setSale_end_time(sdf.parse(json.getString("sale_end_time")));
			picture.setSale_time(sdf.parse(json.getString("sale_time")));
		} catch (JSONException | ParseException e) {
			e.printStackTrace();
		}
		boolean update = false;
		try {
			 update = picdao.update(picture);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		resp.setContentType("application/json; charset=UTF-8;");
		resp.getWriter().append("{\"update\" :"+update+"}");
	}
}
