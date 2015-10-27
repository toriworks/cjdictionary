package com.hyonga.dictionary.domain;

public class HeritageSearchRelations {

    private String entryTitle;
    private String idx;
    private String filename;
    private String tag;

    public String getEntryTitle() {
        return entryTitle;
    }

    public void setEntryTitle(String entryTitle) {
        this.entryTitle = entryTitle;
    }

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "HeritageSearchRelations{" +
                "entryTitle='" + entryTitle + '\'' +
                ", idx='" + idx + '\'' +
                ", filename='" + filename + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }
}
