package kr.com.amean.entity.experience;

import java.util.Date;

/**
 * 체험 신청
 */
public class Apply {
	
	private int a_num;
	private String id;
	private int e_num;
	private int addressNum;
	private Date insertDate;
	private int c_num;
	/**
	 * 1 = 체험신청
	 * 2 = 선정
	 * 3 = 미작성
	 * 4 = 작성완료
	 * 5 = 수정중
	 * 6 = 최종 완료
	 * 0 = 선정취소
	 * -1 = 체험취소
	 */
	private int state;
	private Date createDate;
	private String comment;
	private String cancel_reason;
	private Date cancel_date;
	private boolean cancel_state;

	public Apply(int a_num, String id, int e_num, int addressNum, Date insertDate, int c_num, int state, Date createDate, String comment, String cancel_reason, Date cancel_date,
			boolean cancel_state) {
		this.a_num = a_num;
		this.id = id;
		this.addressNum = addressNum;
		this.e_num = e_num;
		this.insertDate = insertDate;
		this.c_num = c_num;
		this.state = state;
		this.createDate = createDate;
		this.comment = comment;
		this.cancel_reason = cancel_reason;
		this.cancel_date = cancel_date;
		this.cancel_state = cancel_state;
	}

	public Apply() {}

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

	public int getAddressNum() {
		return addressNum;
	}

	public void setAddressNum(int addressNum) {
		this.addressNum = addressNum;
	}

	public int getE_num() {
		return e_num;
	}

	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	public Date getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}

	public int getC_num() {
		return this.c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCancel_reason() {
		return cancel_reason;
	}

	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}

	public Date getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(Date cancel_date) {
		this.cancel_date = cancel_date;
	}

	public boolean isCancel_state() {
		return cancel_state;
	}

	public void setCancel_state(boolean cancel_state) {
		this.cancel_state = cancel_state;
	}

}
