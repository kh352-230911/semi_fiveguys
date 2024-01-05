package com.sh.guys.review.model.entity;

import java.time.LocalDateTime;

public class ReviewComment {
    private String no;
    private String usersNo;
    private String reviewNo;
    private String content;
    private int commentLevel;
    private String parentCommentNo;
    private LocalDateTime regDate;

    public ReviewComment() {
    }

    public ReviewComment(String no, String usersNo, String reviewNo, String content, int commentLevel, String parentCommentNo, LocalDateTime regDate) {
        this.no = no;
        this.usersNo = usersNo;
        this.reviewNo = reviewNo;
        this.content = content;
        this.commentLevel = commentLevel;
        this.parentCommentNo = parentCommentNo;
        this.regDate = regDate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getUsersNo() {
        return usersNo;
    }

    public void setUsersNo(String usersNo) {
        this.usersNo = usersNo;
    }

    public String getReviewNo() {
        return reviewNo;
    }

    public void setReviewNo(String reviewNo) {
        this.reviewNo = reviewNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCommentLevel() {
        return commentLevel;
    }

    public void setCommentLevel(int commentLevel) {
        this.commentLevel = commentLevel;
    }

    public String getParentCommentNo() {
        return parentCommentNo;
    }

    public void setParentCommentNo(String parentCommentNo) {
        this.parentCommentNo = parentCommentNo;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "ReviewComment{" +
                "no='" + no + '\'' +
                ", usersNo='" + usersNo + '\'' +
                ", reviewNo='" + reviewNo + '\'' +
                ", content='" + content + '\'' +
                ", commentLevel=" + commentLevel +
                ", parentCommentNo='" + parentCommentNo + '\'' +
                ", regDate=" + regDate +
                '}';
    }
}
