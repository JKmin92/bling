package kr.com.amean.entity;

/**
 * USER - 추후 핸드폰, 주소지, 성별은 별도 관리
 * @author 정기민
 *
 */
public class User {
	
	private String id;
	private String pw;
	private String name;
	private String phone_number;
	private String address;
	private String gender;
	private String email;
	/**
	 * 네이버 계정
	 */
	private String n_id;
	/**
	 * 인스타그램 계정
	 */
	private String i_id;
	
	public User(String id, String pw, String name, String phone_number, String address, String gender, String email,
			String n_id, String i_id) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone_number = phone_number;
		this.address = address;
		this.gender = gender;
		this.email = email;
		this.n_id = n_id;
		this.i_id = i_id;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	
	
	
	

}
