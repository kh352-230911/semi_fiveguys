package com.sh.guys.review.model.entity;

import java.time.LocalDateTime;

public class ReviewPicture {
    private String no;
    private String reviewNo;
    private String renamedFilename;
    private LocalDateTime regDate;

    public ReviewPicture() {}

    public ReviewPicture(String no, String reviewNo, String renamedFilename, LocalDateTime regDate) {
        this.no = no;
        this.reviewNo = reviewNo;
        this.renamedFilename = renamedFilename;
        this.regDate = regDate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getReviewNo() {
        return reviewNo;
    }

    public void setReviewNo(String reviewNo) {
        this.reviewNo = reviewNo;
    }

    public String getRenamedFilename() {
        return renamedFilename;
    }

    public void setRenamedFilename(String renamedFilename) {
        this.renamedFilename = renamedFilename;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "ReviewPicture{" +
                "no='" + no + '\'' +
                ", reviewNo='" + reviewNo + '\'' +
                ", renamedFilename='" + renamedFilename + '\'' +
                ", regDate=" + regDate +
                '}';
    }
}
