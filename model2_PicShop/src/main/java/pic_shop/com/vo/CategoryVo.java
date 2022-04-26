package pic_shop.com.vo;

public class CategoryVo {
	private int cate_num;
	private String name;
	private int sub;
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSub() {
		return sub;
	}
	public void setSub(int sub) {
		this.sub = sub;
	}
	@Override
	public String toString() {
		return "{\"cate_num\": " + cate_num + ", \"name\": \"" + name + "\", \"sub\": " + sub + "}";
	}
	
	
	
}
