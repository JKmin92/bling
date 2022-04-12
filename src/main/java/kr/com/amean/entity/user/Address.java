package kr.com.amean.entity.user;

public class Address {

    private int aNum;
    private String id;
    private String name;
    private String address;
    private String detail;
    private String zipCode;
    private boolean basic;

    public Address() {
        //empty
    }

    public Address(int aNum, String id, String name, String address, String detail, String zipCode, boolean basic) {
        this.aNum = aNum;
        this.id = id;
        this.name = name;
        this.address = address;
        this.detail = detail;
        this.zipCode = zipCode;
        this.basic = basic;
    }

    public Address(String id, String address, String detail, String zipCode, boolean basic) {
        this.id = id;
        this.address = address;
        this.detail = detail;
        this.zipCode = zipCode;
        this.basic = basic;
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

    public String getDetail() {
        return this.detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getZipCode() {
        return this.zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public boolean isBasic() {
        return this.basic;
    }

    public void setBasic(boolean basic) {
        this.basic = basic;
    }
    
    
}
