package com.hyonga.dictionary.domain;

public class HeritageSearchResult {

    private int idx;
    private String munitidx;
    private String entryTitle;
    private String ucicode;
    private String entryTitleC;
    private String tag;

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getMunitidx() {
        return munitidx;
    }

    public void setMunitidx(String munitidx) {
        this.munitidx = munitidx;
    }

    public String getEntryTitle() {
        return entryTitle;
    }

    public void setEntryTitle(String entryTitle) {
        this.entryTitle = entryTitle;
    }

    public String getUcicode() {
        return ucicode;
    }

    public void setUcicode(String ucicode) {
        this.ucicode = ucicode;
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
        return "HeritageSearchResult{" +
                "idx=" + idx +
                ", munitidx='" + munitidx + '\'' +
                ", entryTitle='" + entryTitle + '\'' +
                ", ucicode='" + ucicode + '\'' +
                ", entryTitleC='" + entryTitleC + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }
}
