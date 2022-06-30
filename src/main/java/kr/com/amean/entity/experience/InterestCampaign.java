package kr.com.amean.entity.experience;

public class InterestCampaign {
    
    private int ic_num;
    private int e_num;
    private String id;

    public InterestCampaign() {
        //empty
    }

    public InterestCampaign(int ic_num, int e_num, String id) {
        this.ic_num = ic_num;
        this.e_num = e_num;
        this.id = id;
    }

    public InterestCampaign(int e_num, String id) {
        this.e_num = e_num;
        this.id = id;
    }

    public int getIc_num() {
        return this.ic_num;
    }

    public void setIc_num(int ic_num) {
        this.ic_num = ic_num;
    }

    public int getE_num() {
        return this.e_num;
    }

    public void setE_num(int e_num) {
        this.e_num = e_num;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
