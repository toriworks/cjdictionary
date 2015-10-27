package com.hyonga.dictionary.domain;

public class HeritageSearchBasic {

    private String recType;
    private String content;

    public String getRecType() {
        return recType;
    }

    public void setRecType(String recType) {
        this.recType = recType;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "HeritageSearchBasic{" +
                "recType='" + recType + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
