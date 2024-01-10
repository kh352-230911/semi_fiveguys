package com.sh.guys.review.model.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class    Review {
    private  String no;
    private  String restNo;
    private  String usersNo;
    private  String content;
    private  double starGrade;
    private LocalDateTime regDate;

    public Review() {}

    public Review(String no, String restNo, String usersNo, String content, double starGrade, LocalDateTime regDate) {
        this.no = no;
        this.restNo = restNo;
        this.usersNo = usersNo;
        this.content = content;
        this.starGrade = starGrade;
        this.regDate = regDate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getRestNo() {
        return restNo;
    }

    public void setRestNo(String restNo) {
        this.restNo = restNo;
    }

    public String getUsersNo() {
        return usersNo;
    }

    public void setUsersNo(String usersNo) {
        this.usersNo = usersNo;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public double getStarGrade() {
        return starGrade;
    }

    public void setStarGrade(double starGrade) {
        this.starGrade = starGrade;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "Review{" +
                "no='" + no + '\'' +
                ", restNo='" + restNo + '\'' +
                ", usersNo='" + usersNo + '\'' +
                ", content='" + content + '\'' +
                ", starGrade=" + starGrade +
                ", regDate=" + regDate +
                '}';
    }
}
