package com.hyonga.dictionary.domain;

public class HeritageSearchImgResult {

    private String idx;
    private String imageCaption;
    private String filename;

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getImageCaption() {
        return imageCaption;
    }

    public void setImageCaption(String imageCaption) {
        this.imageCaption = imageCaption;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    @Override
    public String toString() {
        return "HeritageSearchImgResult{" +
                "idx='" + idx + '\'' +
                ", imageCaption='" + imageCaption + '\'' +
                ", filename='" + filename + '\'' +
                '}';
    }
}
