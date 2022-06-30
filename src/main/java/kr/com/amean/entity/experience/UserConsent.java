package kr.com.amean.entity.experience;

public class UserConsent {
    
    private int uc_num;
    private int c_num;
    private int a_num;
    private String id;
    private String userAnser;

    public UserConsent() {}

    public UserConsent(int uc_num, int c_num, int a_num, String id, String userAnser) {
        this.uc_num = uc_num;
        this.c_num = c_num;
        this.a_num = a_num;
        this.id = id;
        this.userAnser = userAnser;
    }

    public UserConsent(int c_num, int a_num, String id, String userAnser) {
        this.c_num = c_num;
        this.a_num = a_num;
        this.id = id;
        this.userAnser = userAnser;
    }

    public int getUc_num() {
        return this.uc_num;
    }

    public void setUc_num(int uc_num) {
        this.uc_num = uc_num;
    }

    public int getC_num() {
        return this.c_num;
    }

    public void setC_num(int c_num) {
        this.c_num = c_num;
    }

    public int getA_num() {
        return this.a_num;
    }

    public void setA_num(int a_num) {
        this.a_num = a_num;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserAnser() {
        return this.userAnser;
    }

    public void setUserAnser(String userAnser) {
        this.userAnser = userAnser;
    }


}
