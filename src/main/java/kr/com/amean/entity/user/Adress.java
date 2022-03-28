package kr.com.amean.entity.user;

public class Adress {

    private int aNum;
    private String id;
    private String name;
    private String address;
    private String zipCode;

    public Adress() {
        //empty
    }

    public Adress(int aNum, String id, String name, String address, String zipCode) {
        this.aNum = aNum;
        this.id = id;
        this.name = name;
        this.address = address;
        this.zipCode = zipCode;
    }

    public Adress(String id, String address, String zipCode) {
        this.id = id;
        this.address = address;
        this.zipCode = zipCode;
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

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipCode() {
        return this.zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
    
    
}
