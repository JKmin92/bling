package kr.com.amean.entity.board;

import java.util.Date;

public class Board {

    private int b_num;
    private int boardCode;
    private int category;
    private String title;
    private Date registDate;
    private String content;

    public Board() {}

    public Board(int b_num, int boardCode, int category, String title, Date registDate, String content) {
        this.b_num = b_num;
        this.boardCode = boardCode;
        this.category = category;
        this.title = title;
        this.registDate = registDate;
        this.content = content;
    }

    public Board(int boardCode, int category, String title, Date registDate, String content) {
        this.boardCode = boardCode;
        this.category = category;
        this.title = title;
        this.registDate = registDate;
        this.content = content;
    }

    public int getB_num() {
        return this.b_num;
    }

    public void setB_num(int b_num) {
        this.b_num = b_num;
    }

    public int getBoardCode() {
        return this.boardCode;
    }

    public void setBoardCode(int boardCode) {
        this.boardCode = boardCode;
    }

    public int getCategory() {
        return this.category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getRegistDate() {
        return this.registDate;
    }

    public void setRegistDate(Date registDate) {
        this.registDate = registDate;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    
}
