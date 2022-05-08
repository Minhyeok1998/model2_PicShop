package pic_shop.com.vo;

import java.util.Date;

public class CommentVo {
	private int comment_num;
	private String title;
	private String contents;
	private Date post_time;
	private byte pic_grade;
	private int pic_num;
	private String member_id;
	private byte state;
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
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
	public byte getPic_grade() {
		return pic_grade;
	}
	public void setPic_grade(byte pic_grade) {
		this.pic_grade = pic_grade;
	}
	public int getPic_num() {
		return pic_num;
	}
	public void setPic_num(int pic_num) {
		this.pic_num = pic_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public byte getState() {
		return state;
	}
	public void setState(byte state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "PicCommentVo={\"comment_num\": \"" + comment_num + "\", \"title\": \"" + title + "\", \"contents\": \""
				+ contents + "\", \"post_time\": \"" + post_time + "\", \"pic_grade\": \"" + pic_grade
				+ "\", \"pic_num\": \"" + pic_num + "\", \"member_id\": \"" + member_id + "\", \"state\": \"" + state
				+ "\"}\n";
	}
	
	
	
}
