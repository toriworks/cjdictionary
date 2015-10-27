package com.hyonga.dictionary.domain;

public class HeritageSearchEntry {

    private String idx;
    private String schoolIdx;
    private String munitIdx;
    private String entryTitle;
    private String entryTitleK;
    private String entryTitleE;
    private String entryTitleC;
    private String tag;

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getSchoolIdx() {
        return schoolIdx;
    }

    public void setSchoolIdx(String schoolIdx) {
        this.schoolIdx = schoolIdx;
    }

    public String getMunitIdx() {
        return munitIdx;
    }

    public void setMunitIdx(String munitIdx) {
        this.munitIdx = munitIdx;
    }

    public String getEntryTitle() {
        return entryTitle;
    }

    public void setEntryTitle(String entryTitle) {
        this.entryTitle = entryTitle;
    }

    public String getEntryTitleK() {
        return entryTitleK;
    }

    public void setEntryTitleK(String entryTitleK) {
        this.entryTitleK = entryTitleK;
    }

    public String getEntryTitleE() {
        return entryTitleE;
    }

    public void setEntryTitleE(String entryTitleE) {
        this.entryTitleE = entryTitleE;
    }

    public String getEntryTitleC() {
        return entryTitleC;
    }

    public void setEntryTitleC(String entryTitleC) {
        this.entryTitleC = entryTitleC;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "HeritageSearchEntry{" +
                "idx='" + idx + '\'' +
                ", schoolIdx='" + schoolIdx + '\'' +
                ", munitIdx='" + munitIdx + '\'' +
                ", entryTitle='" + entryTitle + '\'' +
                ", entryTitleK='" + entryTitleK + '\'' +
                ", entryTitleE='" + entryTitleE + '\'' +
                ", entryTitleC='" + entryTitleC + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }
}
