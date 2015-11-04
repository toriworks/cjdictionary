package com.hyonga.dictionary.domain;

import java.util.Arrays;
import java.util.List;

public class CommonBasicXML {

    private String bodyFirst;
    private String bodyImg;
    private List<String> bodySecond;

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

    public List<String> getBodySecond() {
        return bodySecond;
    }

    public void setBodySecond(List<String> bodySecond) {
        this.bodySecond = bodySecond;
    }

    @Override
    public String toString() {
        return "CommonBasicXML{" +
                "bodyFirst='" + bodyFirst + '\'' +
                ", bodyImg='" + bodyImg + '\'' +
                ", bodySecond=" + bodySecond +
                '}';
    }
}
