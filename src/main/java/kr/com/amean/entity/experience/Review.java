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
	private String blog;
	private String instagram;
	private String homepage;
	private String store;
	private String receipt;
	/**
	 * 작성상태
	 * 0=미작성
	 * 1=작성
	 * 2=수정
	 * 3=완료
	 * 4=�Ϸ�
	 */
	private int state;
	
	public Review(int r_num, int a_num, String id, int e_num, Date wirte_date, String blog, String instagram, String homepage, String store, String receipt, int state) {
		this.r_num = r_num;
		this.a_num = a_num;
		this.id = id;
		this.e_num = e_num;
		this.wirte_date = wirte_date;
		this.blog = blog;
		this.instagram = instagram;
		this.homepage = homepage;
		this.store = store;
		this.receipt = receipt;
		this.state = state;
	}

	public Review(int a_num, String id, int e_num, Date wirte_date, String blog, String instagram, String homepage, String store, String receipt, int state) {
		this.a_num = a_num;
		this.id = id;
		this.e_num = e_num;
		this.wirte_date = wirte_date;
		this.blog = blog;
		this.instagram = instagram;
		this.homepage = homepage;
		this.store = store;
		this.receipt = receipt;
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
	public String getBlog() {
		return this.blog;
	}

	public void setBlog(String blog) {
		this.blog = blog;
	}

	public String getInstagram() {
		return this.instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}
	public String getHomepage() {
		return this.homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getStore() {
		return this.store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getReceipt() {
		return this.receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
}
