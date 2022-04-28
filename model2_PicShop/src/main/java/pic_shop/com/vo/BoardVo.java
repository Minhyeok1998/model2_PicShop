package pic_shop.com.vo;

import java.util.Date;

public class BoardVo {
	private int num;
	private String member_id;
	private String title;
	private String contents;
	private Date post_time;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getPost_time() {
		return post_time;
	}
	public void setPost_time(Date post_time) {
		this.post_time = post_time;
	}
	public byte getState() {
		return state;
	}
	public void setState(byte state) {
		this.state = state;
	}
	private byte state;

	@Override
	public String toString() {
		return "BoardVo={\"num\": \"" + num + "\", \"member_id\": \"" + member_id + "\", \"title\": \"" + title
				+ "\", \"contents\": \"" + contents + "\", \"post_time\": \"" + post_time + "\", \"state\": \"" + state
				+ "\"}\n";
	}
	
	
}
