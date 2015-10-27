package com.hyonga.dictionary.domain;

public class HeritageSearchEntryUCIResult {

    private String uciCode;
    private String chapterData;
    private String relationEntryData;
    private String termsData;

    public String getUciCode() {
        return uciCode;
    }

    public void setUciCode(String uciCode) {
        this.uciCode = uciCode;
    }

    public String getChapterData() {
        return chapterData;
    }

    public void setChapterData(String chapterData) {
        this.chapterData = chapterData;
    }

    public String getRelationEntryData() {
        return relationEntryData;
    }

    public void setRelationEntryData(String relationEntryData) {
        this.relationEntryData = relationEntryData;
    }

    public String getTermsData() {
        return termsData;
    }

    public void setTermsData(String termsData) {
        this.termsData = termsData;
    }

    @Override
    public String toString() {
        return "HeritageSearchEntryUCIResult{" +
                "uciCode='" + uciCode + '\'' +
                ", chapterData='" + chapterData + '\'' +
                ", relationEntryData='" + relationEntryData + '\'' +
                ", termsData='" + termsData + '\'' +
                '}';
    }
}
