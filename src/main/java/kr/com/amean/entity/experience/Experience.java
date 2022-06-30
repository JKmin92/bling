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
	private String subArea;
	private boolean kind_n;
	private boolean kind_i;
	private boolean kind_s;
	private boolean kind_h;
	private boolean kind_r;
	/**
	 * 모집인원
	 */
	private int headCount;
	private int applyCount;
	private String content;
	private Date startDate;
	private Date endDate;
	private Date desDate;
	private Date closeDate;
	private boolean open;
	
	public Experience(int e_num, String title, String subject, String service, String main_img, String mCategory, String sCategory, 
	String area, String subArea, boolean kind_n, boolean kind_i, boolean kind_s, boolean kind_h, boolean kind_r, int headCount, int applyCount, String content,
			Date startDate, Date endDate, Date desDate, Date closeDate, boolean open) {
		this.e_num = e_num;
		this.title = title;
		this.subject = subject;
		this.service = service;
		this.mCategory = mCategory;
		this.sCategory = sCategory;
		this.area = area;
		this.subArea = subArea;
		this.kind_n = kind_n;
		this.kind_i = kind_i;
		this.kind_s = kind_s;
		this.kind_h = kind_h;
		this.kind_r = kind_r;
		this.headCount = headCount;
		this.applyCount = applyCount;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.desDate = desDate;
		this.closeDate = closeDate;
		this.open = open;
	}

	public Experience(String title, String subject, String service, String main_img, String mCategory, String sCategory, 
	String area, String subArea,boolean kind_n, boolean kind_i, boolean kind_s, boolean kind_h, boolean kind_r, int headCount, int applyCount, String content,
			Date startDate, Date endDate, Date desDete, Date closeDate, boolean open) {
		this.title = title;
		this.subject = subject;
		this.service = service;
		this.mCategory = mCategory;
		this.sCategory = sCategory;
		this.area = area;
		this.subArea = subArea;
		this.kind_n = kind_n;
		this.kind_i = kind_i;
		this.kind_s = kind_s;
		this.kind_h = kind_h;
		this.kind_r = kind_r;
		this.headCount = headCount;
		this.applyCount = applyCount;
		this.content = content;
		this.startDate = startDate;
		this.endDate = endDate;
		this.desDate = desDete;
		this.closeDate = closeDate;
		this.open = open;
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

	public String getSubArea() {
		return subArea;
	}

	public void setSubArea(String subArea) {
		this.subArea = subArea;
	}

	public boolean isKind_n() {
		return kind_n;
	}

	public void setKind_n(boolean kind_n) {
		this.kind_n = kind_n;
	}

	public boolean isKind_i() {
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

	public int getHeadCount() {
		return headCount;
	}

	public void setHeadCount(int headCount) {
		this.headCount = headCount;
	}

	public int getApplyCount() {
		return applyCount;
	}

	public void setApplyCount(int applyCount) {
		this.applyCount = applyCount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getDesDate() {
		return desDate;
	}

	public void setDesDate(Date desDate) {
		this.desDate = desDate;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}
	
	
}
