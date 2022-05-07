package pic_shop.com.controller.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import pic_shop.com.vo.PicVo;
import pic_shop.com.dao.PicDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/service/pic/list.do")
public class PicList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<PicVo> pic_list = new ArrayList<PicVo>();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PicDao picdao = new PicDao();
		int page = 0;
//		System.out.println(req.getParameter("page"));
		String member_id = null;
		String category = null;
		if (req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));
		}
//		System.out.println("page : "+ page);
		try {
			if (req.getParameter("category") != null) {
				category = req.getParameter("category");
				// pic_list = picdao.list("category",page)구현
			} else {
				if (req.getParameter("member_id") != null) {
					member_id = req.getParameter("member_id");
					// pic_list = picdao.list("member_id",page) 구현
				} else {

					pic_list = (ArrayList<PicVo>) picdao.list(page);
				}
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.getStackTrace();
		}

		//System.out.println(pic_list);
		resp.getWriter().append(pic_list.toString());
	}
}
