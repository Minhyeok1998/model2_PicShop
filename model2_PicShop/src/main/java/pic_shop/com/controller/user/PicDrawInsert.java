package pic_shop.com.controller.user;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import pic_shop.com.dao.PicDao;
import pic_shop.com.vo.CategoryVo;
import pic_shop.com.vo.PicVo;

@WebServlet("/user/draw/draw.do")
public class PicDrawInsert extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
			PicDao picdao = new PicDao();
			List<CategoryVo> cate_list = new ArrayList<>();
			
			try {
				cate_list = picdao.cateList();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.setAttribute("cate_list", cate_list);
			req.getRequestDispatcher("./draw.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		PicVo picture = new PicVo();

		picture.setTitle(req.getParameter("title"));
		picture.setName(req.getParameter("name"));
		picture.setCount(Integer.parseInt(req.getParameter("count")));
		picture.setPrice(Integer.parseInt(req.getParameter("price")));
		picture.setFrame(req.getParameter("frame"));
		picture.setMain_img(req.getParameter("main_img"));
		picture.setImg_comment(req.getParameter("img_comment"));
		picture.setPic_num(req.getParameter("pic_num"));
		picture.setMember_id(req.getParameter("member_id"));
		//문자열을 데이트로 형변환 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try {
			picture.setPost_time(sdf.parse(req.getParameter("post_time")));
			picture.setSale_time(sdf.parse(req.getParameter("sale_time")));
			if(!req.getParameter("sale_end_time").equals(""))
				picture.setSale_end_time(sdf.parse(req.getParameter("sale_end_time")));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		picture.setState(Byte.parseByte(req.getParameter("state")));
		picture.setCate_num(Integer.parseInt(req.getParameter("cate_num")));

		System.out.println(picture);
		//성공시 list.do 등록 성공 alert!
		//실패시 insert.do 등록 실패 alert!
		
		PicDao picdao = new PicDao();
		boolean insert=false;
		try {
			insert=picdao.insert(picture);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		HttpSession session=req.getSession();
//		session.setAttribute("insert", insert);
		req.getSession().setAttribute("insert", insert);
		if(insert) {
			resp.sendRedirect("./draw.do");
		}else {
			resp.sendRedirect("./draw.do");
		}


		
	
		
	}

}
