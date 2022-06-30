package kr.com.amean.entity.bank;

import java.util.Date;

public class BankTake {
    
    private int bt_num;
    private int b_num;
    private String id;
    private Date takeDate;
    private String takeContent;
    private int takePoint;
    /**
     * 0 = 출금신청
     * 1 = 출금신청완료
     * 2 = 지연
     */
    private int state;

    public BankTake() {}

    public BankTake(int bt_num, int b_num, String id, Date takeDate, String takeContent, int takePoint, int state) {
        this.bt_num = bt_num;
        this.b_num = b_num;
        this.id = id;
        this.takeDate = takeDate;
        this.takeContent = takeContent;
        this.takePoint = takePoint;
        this.state = state;
    }

    public BankTake(int b_num, String id, Date takeDate, String takeContent, int takePoint, int state) {
        this.b_num = b_num;
        this.id = id;
        this.takeDate = takeDate;
        this.takeContent = takeContent;
        this.takePoint = takePoint;
        this.state = state;
    }

    public int getBt_num() {
		return this.bt_num;
	}

	public void setBt_num(int bt_num) {
		this.bt_num = bt_num;
	}

    public int getB_num() {
        return this.b_num;
    }

    public void setB_num(int b_num) {
        this.b_num = b_num;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getTakeDate() {
        return this.takeDate;
    }

    public void setTakeDate(Date takeDate) {
        this.takeDate = takeDate;
    }

    public String getTakeContent() {
        return this.takeContent;
    }

    public void setTakeContent(String takeContent) {
        this.takeContent = takeContent;
    }

    public int getTakePoint() {
        return this.takePoint;
    }

    public void setTakePoint(int takePoint) {
        this.takePoint = takePoint;
    }

    public int getState() {
        return this.state;
    }

    public void setState(int state) {
        this.state = state;
    }
}
