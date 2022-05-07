package pic_shop.com.etc;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import pic_shop.com.vo.MemberVo;

public interface MemberDaoAble {
		
	public List<MemberVo> list(int page) throws ClassNotFoundException, SQLException;	//������ ��� ����Ʈ
	public MemberVo detail_id(String id) throws ClassNotFoundException, SQLException;	//������ ����, �������� ����������, �������� �������� 
	public MemberVo detail_phone(String phone) throws ClassNotFoundException, SQLException;
	public MemberVo detail_email(String email) throws ClassNotFoundException, SQLException;
	public boolean insert(MemberVo mem) throws ClassNotFoundException, SQLException;	//ȸ�����, ȸ������
	public boolean update(MemberVo mem) throws ClassNotFoundException, SQLException;	//ȸ������, ���� ���� ����
	public boolean delete(String id) throws ClassNotFoundException, SQLException;	//ȸ������ => ���� �ܷ�Ű�� �����ϴ� ���̺��� ���� ������
	
//	public MemberVo getLoginMember(HttpServletRequest req);	//�α���
//	public boolean login(MemberVo member);	//�α���
//	public int insert_login(MemberVo member);
//	public int login_check(MemberVo member);


}
