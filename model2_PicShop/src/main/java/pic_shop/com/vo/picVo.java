package pic_shop.com.vo;

public class picVo {
	private String NAME,TITLE;

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	@Override
	public String toString() {
		return "picVo={\"NAME\": \"" + NAME + "\", \"TITLE\": \"" + TITLE + "\"}";
	}
	
	
}
