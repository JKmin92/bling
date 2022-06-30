package kr.com.amean.entity.user;

/**
 * user interests
 */
public class Interest {

    private int iNum;
    private String id;
    private String item;

    public Interest() {
        //empty
    }

    public Interest(String id, String item) {
        this.id = id;
        this.item = item;
    }

    public Interest(int iNum, String id, String item) {
        this.iNum = iNum;
        this.id = id;
        this.item = item;
    }

    public void setINum(int iNum) {
        this.iNum = iNum;
    }

    public int getINum() {
        return this.iNum;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return this.id;
    }

    public void setItem(String item) {
        this.item = item;
    }
    
    public String getItem() {
        return this.item;
    }

    
}
