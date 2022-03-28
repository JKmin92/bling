package kr.com.amean.entity.experience;

import java.util.Date;

/**
 * 리뷰
 */
public class Review {
	
	private int r_num;
	private int a_num;
	private String id;
	private int e_num;
	private Date wirte_date;
	private String url;
	/**
	 * ����ĸó��
	 */
	private String img;
	/**
	 * 작성상태
	 * 0=미작성
	 * 1=작성
	 * 2=수정
	 * 3=완료
	 * 4=�Ϸ�
	 */
	private int state;
	
	public Review(int r_num, int a_num, String id, int e_num, Date wirte_date, String url, String img, int state) {
		this.r_num = r_num;
		this.a_num = a_num;
		this.id = id;
		this.e_num = e_num;
		this.wirte_date = wirte_date;
		this.url = url;
		this.img = img;
		this.state = state;
	}

	public Review(int a_num, String id, int e_num, Date wirte_date, String url, String img, int state) {
		this.a_num = a_num;
		this.id = id;
		this.e_num = e_num;
		this.wirte_date = wirte_date;
		this.url = url;
		this.img = img;
		this.state = state;
	}
	
	public Review() {}
	
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
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
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public Date getWirte_date() {
		return wirte_date;
	}
	public void setWirte_date(Date wirte_date) {
		this.wirte_date = wirte_date;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	

}
