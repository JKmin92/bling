package kr.com.amean.entity.experience;

import java.util.Date;

/**
 * 체험 정보
 */
public class Experience {
	
	private int e_num;
	private String title;
	private String subject;
	private String service;
	private String main_img;
	private String mCategory;
	private String sCategory;
	private String area;
	private boolean kind_n;
	private boolean kind_i;
	private boolean kind_s;
	private boolean kind_h;
	private boolean kind_r;
	/**
	 * 모집인원
	 */
	private int head_count;
	private String content;
	private String contentImage;
	private Date start_date;
	private Date end_date;
	private Date des_date;
	
	public Experience(int e_num, String title, String subject, String service, String main_img, String mCategory, String sCategory, 
	String area, boolean kind_n, boolean kind_i, boolean kind_s, boolean kind_h, boolean kind_r, int head_count, String content, String contentImage,
			Date start_date, Date end_date, Date des_date) {
		this.e_num = e_num;
		this.title = title;
		this.subject = subject;
		this.service = service;
		this.mCategory = mCategory;
		this.sCategory = sCategory;
		this.area = area;
		this.kind_n = kind_n;
		this.kind_i = kind_i;
		this.kind_s = kind_s;
		this.kind_h = kind_h;
		this.kind_r = kind_r;
		this.head_count = head_count;
		this.content = content;
		this.contentImage = contentImage;
		this.start_date = start_date;
		this.end_date = end_date;
		this.des_date = des_date;
	}

	public Experience(String title, String subject, String service, String main_img, String mCategory, String sCategory, 
	String area, boolean kind_n, boolean kind_i, boolean kind_s, boolean kind_h, boolean kind_r, int head_count, String content, String contentImage,
			Date start_date, Date end_date, Date des_dete) {
		this.title = title;
		this.subject = subject;
		this.service = service;
		this.mCategory = mCategory;
		this.sCategory = sCategory;
		this.area = area;
		this.kind_n = kind_n;
		this.kind_i = kind_i;
		this.kind_s = kind_s;
		this.kind_h = kind_h;
		this.kind_r = kind_r;
		this.head_count = head_count;
		this.content = content;
		this.contentImage = contentImage;
		this.start_date = start_date;
		this.end_date = end_date;
		this.des_date = des_dete;
	}

	public Experience() {}

	public int getE_num() {
		return e_num;
	}

	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}
	
	public String getMain_img() {
		return main_img;
	}

	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}

	public String getMCategory() {
		return this.mCategory;
	}

	public void setMCategory(String mCategory) {
		this.mCategory = mCategory;
	}

	public String getSCategory() {
		return this.sCategory;
	}

	public void setSCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public boolean getKind_n() {
		return kind_n;
	}

	public void setKind_n(boolean kind_n) {
		this.kind_n = kind_n;
	}

	public boolean getKind_i() {
		return kind_i;
	}

	public void setKind_i(boolean kind_i) {
		this.kind_i = kind_i;
	}

	public boolean isKind_s() {
		return kind_s;
	}

	public void setKind_s(boolean kind_s) {
		this.kind_s = kind_s;
	}

	public boolean isKind_h() {
		return kind_h;
	}

	public void setKind_h(boolean kind_h) {
		this.kind_h = kind_h;
	}

	public boolean isKind_r() {
		return kind_r;
	}

	public void setKind_r(boolean kind_r) {
		this.kind_r = kind_r;
	}

	public int getHead_count() {
		return head_count;
	}

	public void setHead_count(int head_count) {
		this.head_count = head_count;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getContentImage() {
		return contentImage;
	}

	public void setContentImage(String contentImage) {
		this.contentImage = contentImage;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public Date getDes_date() {
		return des_date;
	}

	public void setDes_date(Date des_date) {
		this.des_date = des_date;
	}

	
	
	
}
