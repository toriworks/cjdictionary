package com.hyonga.dictionary.domain;

public class HeritageSearchCondition {

    private String munitidx = "";
    private String entryTitle = "";

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

    @Override
    public String toString() {
        return "HeritageSearchCondition{" +
                "munitidx='" + munitidx + '\'' +
                ", entryTitle='" + entryTitle + '\'' +
                '}';
    }
}
