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

import pic_shop.com.dao.MemberDao;
import pic_shop.com.vo.CategoryVo;
import java.util.*;
import org.json.*;
@WebServlet("/admin/mem/ajax.do")
public class MemberAjaxManagerA extends HttpServlet{
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDao memDao = new MemberDao();
		resp.setContentType("application/json; charset=UTF-8");
		BufferedReader br = req.getReader();
		StringBuffer sb = new StringBuffer();
		String line ="";
		while((line = br.readLine())!= null) {
			sb.append(line);
		}
		JSONObject json = new JSONObject(sb.toString());
		JSONArray delete_list = json.getJSONArray("delete_list");
		boolean delete = false;
		try {
			delete =memDao.delete_jsonArr(delete_list);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		resp.getWriter().append("{\"delete\" : "+delete+"}");
		
	}
}
