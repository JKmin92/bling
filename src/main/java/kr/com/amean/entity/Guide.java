package kr.com.amean.entity;

public class Guide {
	
	private int g_num;
	private int e_num;
	private String key_word;
	/**
	 * 제목 작성 요령
	 */
	private String title;
	/**
	 * 본문 작성 요령
	 */
	private String content;
	private String tag;
	/**
	 * 매장위치
	 */
	private String ex_area;
	/**
	 * 방문시간, 주말방문여부, 공휴일 등
	 */
	private String visit_time;
	/**
	 * 체험(또는 예약) 방법안내
	 */
	private String how_service;
	/**
	 * 스마트스토어 제품 주문 요령
	 */
	private String how_store;
	private String notice;
	private String add_content1;
	private String add_content2;
	
	
	public Guide(int g_num, int e_num, String key_word, String title, String content, String tag, String ex_area,
			String visit_time, String how_service, String how_store, String notice, String add_content1,
			String add_content2) {
		this.g_num = g_num;
		this.e_num = e_num;
		this.key_word = key_word;
		this.title = title;
		this.content = content;
		this.tag = tag;
		this.ex_area = ex_area;
		this.visit_time = visit_time;
		this.how_service = how_service;
		this.how_store = how_store;
		this.notice = notice;
		this.add_content1 = add_content1;
		this.add_content2 = add_content2;
	}
	
	
	public Guide() {}


	public int getG_num() {
		return g_num;
	}


	public void setG_num(int g_num) {
		this.g_num = g_num;
	}


	public int getE_num() {
		return e_num;
	}


	public void setE_num(int e_num) {
		this.e_num = e_num;
	}


	public String getKey_word() {
		return key_word;
	}


	public void setKey_word(String key_word) {
		this.key_word = key_word;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getTag() {
		return tag;
	}


	public void setTag(String tag) {
		this.tag = tag;
	}


	public String getEx_area() {
		return ex_area;
	}


	public void setEx_area(String ex_area) {
		this.ex_area = ex_area;
	}


	public String getVisit_time() {
		return visit_time;
	}


	public void setVisit_time(String visit_time) {
		this.visit_time = visit_time;
	}


	public String getHow_service() {
		return how_service;
	}


	public void setHow_service(String how_service) {
		this.how_service = how_service;
	}


	public String getHow_store() {
		return how_store;
	}


	public void setHow_store(String how_store) {
		this.how_store = how_store;
	}


	public String getNotice() {
		return notice;
	}


	public void setNotice(String notice) {
		this.notice = notice;
	}


	public String getAdd_content1() {
		return add_content1;
	}


	public void setAdd_content1(String add_content1) {
		this.add_content1 = add_content1;
	}


	public String getAdd_content2() {
		return add_content2;
	}


	public void setAdd_content2(String add_content2) {
		this.add_content2 = add_content2;
	}
	
	
	
	

}
