package pic_shop.com.controller.user;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import pic_shop.com.dao.PicDao;
import pic_shop.com.vo.CategoryVo;
import pic_shop.com.vo.PicVo;

@WebServlet("/user/draw/draw.do")
public class PicDrawInsert extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		boolean insert = false;
		boolean fileUp = true;
		String savePath = req.getServletContext().getRealPath("public/image");
		int maxSize = 1024 * 1024 * 1;
		MultipartRequest multiReq = null;
		File mainImgFile = null;
		File detailImgFile = null;
		try {
			multiReq = new MultipartRequest(req, savePath, maxSize, "UTF-8", new FileRenamePolicy() {

				@Override
				public File rename(File f) {

					String ext = f.getName().substring(f.getName().lastIndexOf("."));
					String newFileName = "item_" + System.currentTimeMillis() + "_" + (int) (Math.random() * 10000)
							+ ext;
					return new File(f.getParent(), newFileName);

				}
			});

			mainImgFile = multiReq.getFile("main_img");
			detailImgFile = multiReq.getFile("detail_img");
			String mainImgType = multiReq.getContentType("main_img").split("/")[0]; // "image/jpeg" =>image
			String mainImgExt = multiReq.getContentType("main_img").split("/")[1]; // "image/jpeg" =>jpeg
			if (mainImgType.equals("image")) {
				// 메인이미지만 썸네일 생성
				BufferedImage main_img = ImageIO.read(mainImgFile);
				BufferedImage mainImgThumb = new BufferedImage(100, 100, BufferedImage.TYPE_3BYTE_BGR);
				mainImgThumb.getGraphics().drawImage(mainImgThumb, 0, 0, 100, 100, null);
				ImageIO.write(mainImgThumb, mainImgExt, new File(savePath + "/thumb/" + mainImgFile.getName()));
			} else { // 둘중에 하나라도 이미지가 아니면 두 파일 모두 삭제 => dao를 실행 하지 않음
				fileUp = false;
				mainImgFile.delete();
				detailImgFile.delete();
			}

		} catch (Exception e) {
			// 파일이 커서 등록 실패
			fileUp = false;
			e.printStackTrace();
			System.out.println("파일용량을 확인해주세요");
		}
		if (fileUp) {

			PicVo picture = new PicVo();

			picture.setTitle(multiReq.getParameter("title"));
			picture.setName(multiReq.getParameter("name"));
			picture.setCount(Integer.parseInt(multiReq.getParameter("count")));
			picture.setPrice(Integer.parseInt(multiReq.getParameter("price")));
			picture.setFrame(multiReq.getParameter("frame"));
			picture.setMain_img(mainImgFile.getName());
			picture.setImg_comment(multiReq.getParameter("img_comment"));
			picture.setPic_num(multiReq.getParameter("pic_num"));
			picture.setMember_id(multiReq.getParameter("member_id"));
			// 문자열을 데이트로 형변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				picture.setPost_time(sdf.parse(multiReq.getParameter("post_time")));
				picture.setSale_time(sdf.parse(multiReq.getParameter("sale_time")));
				if (!multiReq.getParameter("sale_end_time").equals(""))
					picture.setSale_end_time(sdf.parse(multiReq.getParameter("sale_end_time")));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			picture.setState(Byte.parseByte(multiReq.getParameter("state")));
			picture.setCate_num(Integer.parseInt(multiReq.getParameter("cate_num")));

			System.out.println(picture);
			// 성공시 list.do 등록 성공 alert!
			// 실패시 insert.do 등록 실패 alert!

			PicDao picdao = new PicDao();

			try {
				insert = picdao.insert(picture);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		HttpSession session=req.getSession();
//		session.setAttribute("insert", insert);
		req.getSession().setAttribute("insert", insert);
		if (insert) {
			resp.sendRedirect("./draw.do");
		} else {
			resp.sendRedirect("./draw.do");
		}

	}

}
