package kr.com.amean.entity.user;

public class Area {

    private int aNum;
    private String id;
    private String mLocate;
    private String sLocate;

    public Area() {
        //empry
    }

    public Area(int aNum, String id, String mLocate, String sLocate) {
        this.aNum = aNum;
        this.id = id;
        this.mLocate = mLocate;
        this.sLocate = sLocate;
    }

    public Area(String id, String mLocate, String sLocate) {
        this.id = id;
        this.mLocate = mLocate;
        this.sLocate = sLocate;
    }
    
    public int getANum() {
        return this.aNum;
    }

    public void setANum(int aNum) {
        this.aNum = aNum;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMLocate() {
        return this.mLocate;
    }

    public void setMLocate(String mLocate) {
        this.mLocate = mLocate;
    }

    public String getSLocate() {
        return this.sLocate;
    }

    public void setSLocate(String sLocate) {
        this.sLocate = sLocate;
    }

}
