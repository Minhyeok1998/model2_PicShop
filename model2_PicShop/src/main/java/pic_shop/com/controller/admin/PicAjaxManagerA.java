package pic_shop.com.controller.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pic_shop.com.dao.PicDao;
import pic_shop.com.vo.PicVo;
import java.util.*;
@WebServlet("/admin/picture/ajax.do")
public class PicAjaxManagerA extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<PicVo> pic_list = new ArrayList<PicVo>();
		resp.setContentType("application/json; charset=UTF-8");
		PicDao picdao = new PicDao();
		try {
			pic_list = (ArrayList<PicVo>) picdao.list();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		resp.getWriter().append(pic_list.toString());
		
	}
}
