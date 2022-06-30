package kr.com.amean.entity.experience;

import java.util.ArrayList;

public class Consent {
	
	private int c_num;
	private int e_num;
	private int a_num;
	private int consentCode;
	private String id;
	private String title;
	private String description;
	private String anser;
	private String userAnser;
	private ArrayList<Consent> consentList;
	
	public Consent(int c_num, int e_num, int a_num, int consentCode, String id, String title, String description, String anser, String userAnser, ArrayList<Consent> consentList) {
		this.c_num = c_num;
		this.e_num = e_num;
		this.a_num = a_num;
		this.consentCode = consentCode;
		this.id = id;
		this.title = title;
		this.description = description;
		this.anser = anser;
		this.userAnser = userAnser;
		this.consentList = consentList;
	}
	
	public Consent() {}
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getE_num() {
		return e_num;
	}
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public int getConsentCode() {
		return consentCode;
	}
	public void setConsentCode(int consentCode) {
		this.consentCode = consentCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAnser() {
		return anser;
	}
	public void setAnser(String anser) {
		this.anser = anser;
	}
	public String getUserAnser() {
		return userAnser;
	}
	public void setUserAnser(String userAnser) {
		this.userAnser = userAnser;
	}
	public ArrayList<Consent> getConsentList() {
		return consentList;
	}
	public void setConsentList(ArrayList<Consent> consentList) {
		this.consentList = consentList;
	}

}
