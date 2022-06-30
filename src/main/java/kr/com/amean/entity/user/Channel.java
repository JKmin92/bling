package kr.com.amean.entity.user;

public class Channel {
    
    private int c_num;
    private String id;
    /**
     * 1 = blog
     * 2 = instagram
     * 3 = facebook
     * 4 = youtube
     */
    private int channelCode;
    private String url;
    private boolean basic;

    public Channel() {}

    public Channel(int c_num, String id, int channelCode, String url, boolean basic) {
        this.c_num = c_num;
        this.id = id;
        this.channelCode = channelCode;
        this.url = url;
        this.basic = basic;
    }

    public Channel(String id, int channelCode, String url, boolean basic) {
        this.id = id;
        this.channelCode = channelCode;
        this.url = url;
        this.basic = basic;
    }

    public int getC_num() {
        return this.c_num;
    }

    public void setC_num(int c_num) {
        this.c_num = c_num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getChannelCode() {
        return this.channelCode;
    }

    public void setChannelCode(int channelCode) {
        this.channelCode = channelCode;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public boolean isBasic() {
        return this.basic;
    }

    public void setBasic(boolean basic) {
        this.basic = basic;
    }
   
}
