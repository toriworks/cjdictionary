package com.hyonga.dictionary.domain;

public class HeritageSearchCondition {

    private String munitidx = "";
    private String entryTitle = "";
    private int startPage = 1;

    public String getEntryTitle() {
        return entryTitle;
    }

    public void setEntryTitle(String entryTitle) {
        this.entryTitle = entryTitle;
    }

    public String getMunitidx() {
        return munitidx;
    }

    public void setMunitidx(String munitidx) {
        this.munitidx = munitidx;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    @Override
    public String toString() {
        return "HeritageSearchCondition{" +
                "munitidx='" + munitidx + '\'' +
                ", entryTitle='" + entryTitle + '\'' +
                ", startPage=" + startPage +
                '}';
    }
}
