package kr.com.amean.entity;

import org.springframework.web.multipart.MultipartFile;

public class SmartEditorVO {
    private MultipartFile fileData;
    private String callback;
    private String callback_func;

    public SmartEditorVO() {

    }

    public SmartEditorVO(MultipartFile fileData, String callback, String callback_func) {
        this.fileData = fileData;
        this.callback = callback;
        this.callback_func = callback_func;
    }

    public MultipartFile getFileData() {
        return this.fileData;
    }

    public void setFileDate(MultipartFile fileData) {
        this.fileData = fileData;
    }

    public String getCallback() {
        return this.callback;
    }

    public void setCallback(String callback) {
        this.callback = callback;
    }

    public String getCallback_func() {
        return this.callback_func;
    }

    public void setCallback_func(String callback_func) {
        this.callback_func = callback_func;
    }

}