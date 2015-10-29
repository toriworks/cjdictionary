package com.hyonga.dictionary.domain;

public class CommonBasicXML {

    private String bodyFirst;
    private String bodyImg;
    private String bodySecond;

    public String getBodyFirst() {
        return bodyFirst;
    }

    public void setBodyFirst(String bodyFirst) {
        this.bodyFirst = bodyFirst;
    }

    public String getBodyImg() {
        return bodyImg;
    }

    public void setBodyImg(String bodyImg) {
        this.bodyImg = bodyImg;
    }

    public String getBodySecond() {
        return bodySecond;
    }

    public void setBodySecond(String bodySecond) {
        this.bodySecond = bodySecond;
    }

    @Override
    public String toString() {
        return "CommonBasicXML{" +
                "bodyFirst='" + bodyFirst + '\'' +
                ", bodyImg='" + bodyImg + '\'' +
                ", bodySecond='" + bodySecond + '\'' +
                '}';
    }
}
