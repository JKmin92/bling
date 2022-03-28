package kr.com.amean.entity.user;

/**
 * user interests
 */
public class Interest {

    private int iNum;
    private String id;
    private String first;
    private String seconde;
    private String third;

    public Interest() {
        //empty
    }

    public Interest(String id, String first, String seconde, String third) {
        this.id = id;
        this.first = first;
        this.seconde = seconde;
        this.third = third;
    }

    public Interest(int iNum, String id, String first, String seconde, String third) {
        this.iNum = iNum;
        this.id = id;
        this.first = first;
        this.seconde = seconde;
        this.third = third;
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

    public void setFirst(String first) {
        this.first = first;
    }
    
    public String getFirst() {
        return this.first;
    }
    
    public void setSeconde(String seconde) {
        this.seconde = seconde;
    }

    public String getSeconde() {
        return this.seconde;
    }

    public void setThird(String third) {
        this.third = third;
    }

    public String getThird() {
        return this.third;
    }


    
}
