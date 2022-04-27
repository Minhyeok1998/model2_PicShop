package pic_shop.com.vo;

import java.util.Date;

public class PicVo {
	private int num;
	private String name;
	private String title;
	private int count;
	private int price;
	private String frame;
	private String main_img;
	private String img_comment;
	private String pic_num;
	private String member_id;
	private Date post_time;
	private Date sale_time;
	private Date sale_end_time;
	private byte state;
	private int cate_num;
	private String cate_name;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFrame() {
		return frame;
	}
	public void setFrame(String frame) {
		this.frame = frame;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getImg_comment() {
		return img_comment;
	}
	public void setImg_comment(String img_comment) {
		this.img_comment = img_comment;
	}
	public String getPic_num() {
		return pic_num;
	}
	public void setPic_num(String pic_num) {
		this.pic_num = pic_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getPost_time() {
		return post_time;
	}
	public void setPost_time(Date post_time) {
		this.post_time = post_time;
	}
	public Date getSale_time() {
		return sale_time;
	}
	public void setSale_time(Date sale_time) {
		this.sale_time = sale_time;
	}
	public Date getSale_end_time() {
		return sale_end_time;
	}
	public void setSale_end_time(Date sale_end_time) {
		this.sale_end_time = sale_end_time;
	}
	public byte getState() {
		return state;
	}
	public void setState(byte state) {
		this.state = state;
	}
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	@Override
	public String toString() {
		return "{\"num\": " + num + ", \"name\": \"" + name + "\", \"title\": \"" + title
				+ "\", \"count\": " + count + ", \"price\": " + price + ", \"frame\": \"" + frame
				+ "\", \"main_img\": \"" + main_img + "\", \"img_comment\": \"" + img_comment + "\", \"pic_num\": \""
				+ pic_num + "\", \"member_id\": \"" + member_id + "\", \"post_time\": \"" + post_time
				+ "\", \"sale_time\": \"" + sale_time + "\", \"sale_end_time\": \"" + sale_end_time
				+ "\", \"state\": " + state + ", \"cate_num\": " + cate_num + ",\"cate_name\": \""+cate_name +"\"}";
	}
		
}
