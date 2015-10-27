package com.hyonga.dictionary.domain;

public class HeritageSearchInformations {

    private String outlineIdx;
    private String outlineData;
    private String outlineName;

    public String getOutlineIdx() {
        return outlineIdx;
    }

    public void setOutlineIdx(String outlineIdx) {
        this.outlineIdx = outlineIdx;
    }

    public String getOutlineData() {
        return outlineData;
    }

    public void setOutlineData(String outlineData) {
        this.outlineData = outlineData;
    }

    public String getOutlineName() {
        return outlineName;
    }

    public void setOutlineName(String outlineName) {
        this.outlineName = outlineName;
    }

    @Override
    public String toString() {
        return "HeritageSearchInformations{" +
                "outlineIdx='" + outlineIdx + '\'' +
                ", outlineData='" + outlineData + '\'' +
                ", outlineName='" + outlineName + '\'' +
                '}';
    }
}
