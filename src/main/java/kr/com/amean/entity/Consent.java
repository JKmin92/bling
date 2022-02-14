package kr.com.amean.entity;

public class Consent {
	
	private int c_num;
	private int a_num;
	private String id;
	private String contents;
	/**
	 * true=동의
	 * false=미동의
	 */
	private boolean state;
	
	public Consent(int c_num, int a_num, String id, String contents, boolean state) {
		this.c_num = c_num;
		this.a_num = a_num;
		this.id = id;
		this.contents = contents;
		this.state = state;
	}
	
	public Consent() {}
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public boolean isState() {
		return state;
	}
	public void setState(boolean state) {
		this.state = state;
	}

	
	

}
