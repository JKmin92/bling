package kr.com.amean.entity.bank;

import java.util.Date;

public class Cumalative {
    
    private int c_num;
    private int b_num;
    private String id;
    private Date saveDate;
    private String saveContent;
    private int savePoint;

    public Cumalative() {}

    public Cumalative(int c_num, int b_num, String id, Date saveDate, String saveContent, int savePoint) {
        this.c_num = c_num;
        this.b_num = b_num;
        this.id = id;
        this.saveDate = saveDate;
        this.saveContent = saveContent;
        this.savePoint = savePoint;
    }

    public Cumalative(int b_num, String id, Date saveDate, String saveContent, int savePoint) {
        this.b_num = b_num;
        this.id = id;
        this.saveDate = saveDate;
        this.saveContent = saveContent;
        this.savePoint = savePoint;
    }

    public int getC_num() {
        return this.c_num;
    }

    public void setC_num(int c_num) {
        this.c_num = c_num;
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

    public Date getSaveDate() {
        return this.saveDate;
    }

    public void setSaveDate(Date saveDate) {
        this.saveDate = saveDate;
    }

    public String getSaveContent() {
        return this.saveContent;
    }

    public void setSaveContent(String saveContent) {
        this.saveContent = saveContent;
    }

    public int getSavePoint() {
        return this.savePoint;
    }

    public void setSavePoint(int savePoint) {
        this.savePoint = savePoint;
    }
}
