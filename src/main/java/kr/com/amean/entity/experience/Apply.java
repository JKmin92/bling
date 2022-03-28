package kr.com.amean.entity.experience;

import java.util.Date;

/**
 * 체험 신청
 */
public class Apply {
	
	private int a_num;
	private String id;
	private int e_num;
	private Date date;
	private boolean state;
	private String comment;
	private String cancel_reason;
	private Date cancel_date;
	private boolean cancel_state;

	public Apply(int a_num, String id, int e_num, Date date, boolean state, String comment, String cancel_reason, Date cancel_date,
			boolean cancel_state) {
		this.a_num = a_num;
		this.id = id;
		this.e_num = e_num;
		this.date = date;
		this.state = state;
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

	public int getE_num() {
		return e_num;
	}

	public void setE_num(int e_num) {
		this.e_num = e_num;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
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
