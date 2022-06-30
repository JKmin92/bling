package kr.com.amean.entity.user;

/**
 * USER - ���� �ڵ���, �ּ���, ������ ���� ����
 * @author �����
 *
 */
public class User {
	
	private String id;
	private String password;
	private String name;
	private String nickName;
	private String phone_number;
	private String gender;
	private int c_num;
	private boolean sAgr;
	private boolean serviceAgr;
	private boolean privatAgr;
	private String userKey;
	private String kakao_id;
	private String naver_id;
	private String facebook_id;

	public User() {
		//empty
	}
	
	public User(String id, String password, String name, String nickName, String phone_number, String gender, int c_num, boolean sAgr, String userKey, String kakao_id, String naver_id, String facebook_id) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.nickName = nickName;
		this.phone_number = phone_number;
		this.gender = gender;
		this.c_num = c_num;
		this.sAgr = sAgr;
		this.userKey = userKey;
		this.kakao_id = kakao_id;
		this.naver_id = naver_id;
		this.facebook_id = facebook_id;
	}

	public User(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getC_num() {
		return this.c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	public boolean isSAgr() {
		return this.sAgr;
	}

	public void setSAgr(boolean sAgr) {
		this.sAgr = sAgr;
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
	
	public String getUserKey() {
		return this.userKey;
	}

	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}

	public String getKakao_id() {
		return this.kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getNaver_id() {
		return this.naver_id;
	}

	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}

	public String getFacebook_id() {
		return this.facebook_id;
	}

	public void setFacebook_id(String facebook_id) {
		this.facebook_id = facebook_id;
	}

}
