package kr.com.amean.entity.bank;

public class Bank {
    
    private int b_num;
    private String id;
    private String bankName;
    private String bankNumber;
    private String holder;
    private int presentPoint;
    private int cumalatePoint;

    public Bank() {}

    public Bank(int b_num, String id, String bankName, String bankNumber, String holder, int presentPoint, int cumalatePoint) {
        this.b_num = b_num;
        this.id = id;
        this.bankName = bankName;
        this.bankNumber = bankNumber;
        this.holder = holder;
        this.presentPoint = presentPoint;
        this.cumalatePoint = cumalatePoint;
    }

    public Bank(String id, String bankName, String bankNumber, String holder, int presentPoint, int cumalatePoint) {
        this.id = id;
        this.bankName = bankName;
        this.bankNumber = bankNumber;
        this.holder = holder;
        this.presentPoint = presentPoint;
        this.cumalatePoint = cumalatePoint;
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

    public String getBankName() {
        return this.bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankNumber() {
        return this.bankNumber;
    }

    public void setBankNumber(String bankNumber) {
        this.bankNumber = bankNumber;
    }

    public String getHolder() {
        return this.holder;
    }

    public void setHolder(String holder) {
        this.holder = holder;
    }

    public int getPresentPoint() {
        return this.presentPoint;
    }

    public void setPresentPoint(int presentPoint) {
        this.presentPoint = presentPoint;
    }

    public int getCumalatePoint() {
        return this.cumalatePoint;
    }

    public void setCumalatePoint(int cumalatePoint) {
        this.cumalatePoint = cumalatePoint;
    }
}
