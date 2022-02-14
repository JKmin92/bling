package kr.com.amean.entity;

import java.util.Date;

public class Experience {
	
	private int e_num;
	private String title;
	private String subject;
	/**
	 * ��������
	 */
	private String service;
	private String main_img;
	/**
	 * ī�װ�
	 */
	private String category;
	/**
	 * ����
	 */
	private String area;
	/**
	 * ��α�ü��� ����
	 * 0=��ǰ��
	 * 1=�湮��
	 * 2=���ڴ�
	 */
	private int kind_n;
	/**
	 * �ν�Ÿ�׷� ü��� ����
	 * 0=��ǰ��
	 * 1=�湮��
	 * 2=���ڴ�
	 */
	private int kind_i;
	/**
	 * ����Ʈ����� ���� ����
	 * ture=���丮��
	 * false=�Ϲݸ���
	 * null=�����ۼ�����
	 */
	private boolean kind_s;
	/**
	 * Ȩ������ ���� ����
	 * ture=Ȩ������ ���� �ۼ�
	 * null=Ȩ������ ���� �ۼ� ����
	 */
	private boolean kind_h;
	/**
	 * �����ο�
	 */
	private int head_count;
	/**
	 * ���񽺳���
	 */
	private String content;
	/**
	 * ��������
	 */
	private String condition;
	private Date start_date;
	private Date end_date;
	
	public Experience(int e_num, String title, String subject, String service, String main_img, String category, String area, int kind_n,
			int kind_i, boolean kind_s, boolean kind_h, int head_count, String content, String condition,
			Date start_date, Date end_date) {
		this.e_num = e_num;
		this.title = title;
		this.subject = subject;
		this.service = service;
		this.category = category;
		this.area = area;
		this.kind_n = kind_n;
		this.kind_i = kind_i;
		this.kind_s = kind_s;
		this.kind_h = kind_h;
		this.head_count = head_count;
		this.content = content;
		this.condition = condition;
		this.start_date = start_date;
		this.end_date = end_date;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getKind_n() {
		return kind_n;
	}

	public void setKind_n(int kind_n) {
		this.kind_n = kind_n;
	}

	public int getKind_i() {
		return kind_i;
	}

	public void setKind_i(int kind_i) {
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

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
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

	

	
	
	
}
