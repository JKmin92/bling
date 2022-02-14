package kr.com.amean.entity;

public class Management {
	
	private String id;
	private String pw;
	private int permission;
	private String name;
	
	public Management(String id, String pw, int permission, String name) {
		this.id = id;
		this.pw = pw;
		this.permission = permission;
		this.name = name;
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

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	

}
