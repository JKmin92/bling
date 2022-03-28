package kr.com.amean.entity.experience;

public class Guide {

    private int gNum;
    private int eNum;
    private String id;
    private String guideName;
    private String serviceName;
    private String keyword;
    private String subKeyword;
    private String mission;
    private String caution;
    private String teg;
    private String locate;
    private String homepage;
    private String site2;
    private String site3;
    
    public Guide() {}

    public Guide(int gNum, int eNum, String id, String guideName, String serviceName, String keyword, String subKeyword, String mission, 
    String caution, String teg, String locate, String homepage, String site2, String site3) {
        this.gNum = gNum;
        this.eNum = eNum;
        this.id = id;
        this.guideName = guideName;
        this.serviceName = serviceName;
        this.keyword = keyword;
        this.subKeyword = subKeyword;
        this.mission = mission;
        this.caution = caution;
        this.teg = teg;
        this.locate = locate;
        this.homepage = homepage;
        this.site2 = site2;
        this.site3 = site3;
    }

    public Guide(int eNum, String id, String guideName, String serviceName, String keyword, String subKeyword, String mission, String caution, 
    String teg, String locate, String homepage, String site2, String site3) {
        this.eNum = eNum;
        this.id = id;
        this.guideName = guideName;
        this.serviceName = serviceName;
        this.keyword = keyword;
        this.subKeyword = subKeyword;
        this.mission = mission;
        this.caution = caution;
        this.teg = teg;
        this.locate = locate;
        this.homepage = homepage;
        this.site2 = site2;
        this.site3 = site3;
    }

    public int getGNum() {
        return this.gNum;
    }

    public void setGNum(int gNum) {
        this.gNum = gNum;
    }

    public int getENum() {
        return this.eNum;
    }

    public void setENum(int eNum) {
        this.eNum = eNum;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getServiceName() {
        return this.serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getGuideName() {
        return this.guideName;
    }

    public void setGuideName(String guideName) {
        this.guideName = guideName;
    }

    public String getKeyword() {
        return this.keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getSubKeyword() {
        return this.subKeyword;
    }

    public void setSubKeyword(String subKeyword) {
        this.subKeyword = subKeyword;
    }

    public String getMission() {
        return this.mission;
    }

    public void setMission(String mission) {
        this.mission = mission;
    }

    public String getCaution() {
        return this.caution;
    }

    public void setCaution(String caution) {
        this.caution = caution;
    }

    public String getTeg() {
        return this.teg;
    }

    public void setTeg(String teg) {
        this.teg = teg;
    }

    public String getLocate() {
        return this.locate;
    }

    public void setLocate(String locate) {
        this.locate = locate;
    }

    public String getHomepage() {
        return this.homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public String getSite2() {
        return this.site2;
    }

    public void setSite2(String site2) {
        this.site2 = site2;
    }

    public String getSite3() {
        return this.site3;
    }

    public void setSite3(String site3) {
        this.site3 = site3;
    }
    
}