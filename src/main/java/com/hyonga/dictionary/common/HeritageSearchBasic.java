package com.hyonga.dictionary.common;

public class HeritageSearchBasic {

    private String indexContent;
    private String tag;

    public String getIndexContent() {
        return indexContent;
    }

    public void setIndexContent(String indexContent) {
        this.indexContent = indexContent;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "HeritageSearchBasic{" +
                "indexContent='" + indexContent + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }
}
