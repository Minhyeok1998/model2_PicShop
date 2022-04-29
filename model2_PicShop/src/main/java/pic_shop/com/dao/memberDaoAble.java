package pic_shop.com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import pic_shop.com.vo.MemberVo;

public interface memberDaoAble {

	public List<MemberVo> list(int page) throws ClassNotFoundException, SQLException;	//占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙트
	public MemberVo detail_id(String id) throws ClassNotFoundException, SQLException;	//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙, 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙, 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 
	public MemberVo detail_phone(String phone) throws ClassNotFoundException, SQLException;
	public MemberVo detail_email(String email) throws ClassNotFoundException, SQLException;

	public boolean insert(MemberVo mem) throws ClassNotFoundException, SQLException;	//회원등록, 회원가입
	public boolean update(MemberVo mem) throws ClassNotFoundException, SQLException;	//회원수정, 개인 정보 수정
	public boolean delete(String id) throws ClassNotFoundException, SQLException;	//회원삭제 => 위험 외래키로 참조하는 테이블이 많기 때문에
	
}
