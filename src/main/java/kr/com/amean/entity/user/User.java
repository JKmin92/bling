package kr.com.amean.entity.user;

/**
 * USER - ���� �ڵ���, �ּ���, ������ ���� ����
 * @author �����
 *
 */
public class User {
	
	private String id;
	private String pw;
	private String nickName;
	private String phone_number;
	private String gender;
	private String n_id;
	private String i_id;
	private boolean sAgr;
	private boolean eAgr;
	private boolean serviceAgr;
	private boolean privatAgr;

	public User() {
		//empty
	}
	
	public User(String id, String pw, String nickName, String phone_number, String gender, String n_id, String i_id
	, boolean sAgr, boolean eAgr) {
		this.id = id;
		this.pw = pw;
		this.nickName = nickName;
		this.phone_number = phone_number;
		this.gender = gender;
		this.n_id = n_id;
		this.i_id = i_id;
		this.sAgr = sAgr;
		this.eAgr = eAgr;
	}

	public User(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getN_id() {
		return n_id;
	}

	public void setN_id(String n_id) {
		this.n_id = n_id;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}
	
	public boolean isSAgr() {
		return this.sAgr;
	}

	public void setSAgr(boolean sAgr) {
		this.sAgr = sAgr;
	}

	public boolean isEAgr() {
		return this.eAgr;
	}

	public void setEAgr(boolean eAgr) {
		this.eAgr = eAgr;
	}

	public boolean isServiceAgr() {
		return this.serviceAgr;
	}

	public void setServiceAgr(boolean serviceAgr) {
		this.serviceAgr = serviceAgr;
	}

	public boolean isPrivatAgr() {
		return this.privatAgr;
	}

	public void setPrivatAgr(boolean privatAgr) {
		this.privatAgr = privatAgr;
	}
	
	

}
