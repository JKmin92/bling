package kr.com.amean.entity.board;

import java.util.Date;

public class Inquery {
    private int in_num;
    private String id;
    private String title;
    private String kind;
    private String subKind;
    private String content;
    private Date registDate;
    private String anser;
    private Date anserDate;
    /**
     * 0 = 확인중
     * 1 = 답변완료
     */
    private int state;

    public Inquery() {}

    public Inquery(int in_num, String id, String title, String kind, String subKind, String content, Date registDate, String anser, Date anserDate, int state) {
        this.in_num = in_num;
        this.id = id;
        this.title = title;
        this.kind = kind;
        this.subKind = subKind;
        this.content = content;
        this.registDate = registDate;
        this.anser = anser;
        this.anserDate = anserDate;
        this.state = state;
    }

    public Inquery(String id, String title, String kind, String subKind, String content, Date registDate, String anser, Date anserDate, int state) {
        this.id = id;
        this.title = title;
        this.kind = kind;
        this.subKind = subKind;
        this.content = content;
        this.registDate = registDate;
        this.anser = anser;
        this.anserDate = anserDate;
        this.state = state;
    }

    public int getIn_num() {
        return this.in_num;
    }

    public void setIn_num(int in_num) {
        this.in_num = in_num;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getSubKind() {
        return subKind;
    }

    public void setSubKind(String subKind) {
        this.subKind = subKind;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRegistDate() {
        return this.registDate;
    }

    public void setRegistDate(Date registDate) {
        this.registDate = registDate;
    }

    public String getAnser() {
        return this.anser;
    }

    public void setAnser(String anser) {
        this.anser = anser;
    }

    public Date getAnserDate() {
        return this.anserDate;
    }

    public void setAnserDate(Date anserDate) {
        this.anserDate = anserDate;
    }

    public int getState() {
        return this.state;
    }

    public void setState(int state) {
        this.state = state;
    }

}
