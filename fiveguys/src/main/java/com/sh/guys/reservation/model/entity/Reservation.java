package com.sh.guys.reservation.model.entity;

import java.time.LocalDateTime;

public class Reservation {
    private String no;
    private String restNo;
    private String usersNo;
    private String reservName;
    private String reservDate;
    private String reservTime;
    private int reservPeople;
    private String request;
    private LocalDateTime regDate;

    public Reservation() {
    }

    public Reservation(String no, String restNo, String usersNo, String reservName, String reservDate, String reservTime, int reservPeople, String request, LocalDateTime regDate) {
        this.no = no;
        this.restNo = restNo;
        this.usersNo = usersNo;
        this.reservName = reservName;
        this.reservDate = reservDate;
        this.reservTime = reservTime;
        this.reservPeople = reservPeople;
        this.request = request;
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

    public String getReservName() {
        return reservName;
    }

    public void setReservName(String reservName) {
        this.reservName = reservName;
    }

    public String getReservDate() {
        return reservDate;
    }

    public void setReservDate(String reservDate) {
        this.reservDate = reservDate;
    }

    public String getReservTime() {
        return reservTime;
    }

    public void setReservTime(String reservTime) {
        this.reservTime = reservTime;
    }

    public int getReservPeople() {
        return reservPeople;
    }

    public void setReservPeople(int reservPeople) {
        this.reservPeople = reservPeople;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "no='" + no + '\'' +
                ", restNo='" + restNo + '\'' +
                ", usersNo='" + usersNo + '\'' +
                ", reservName='" + reservName + '\'' +
                ", reservDate='" + reservDate + '\'' +
                ", reservTime='" + reservTime + '\'' +
                ", reservPeople=" + reservPeople +
                ", request='" + request + '\'' +
                ", regDate=" + regDate +
                '}';
    }
}
