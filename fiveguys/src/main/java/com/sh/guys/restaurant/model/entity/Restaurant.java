package com.sh.guys.restaurant.model.entity;

import java.time.LocalDate;

public class Restaurant {
    private String restNo;
    private String userNo;
    private String restName;
    private String restAddress;
    private String restContent;
    private String restPhone;
    private String restCategory;
    private String restOpenTime;
    private String restCloseTime;
    private String restReserv;
    private String restReservTime;
    private long restTotalStar;
    private LocalDate restCreatedDate;

    public Restaurant() {
    }

    public Restaurant(String restNo, String userNo, String restName, String restAddress, String restContent, String restPhone, String restCategory, String restOpenTime, String restCloseTime, String restReserv, String restReservTime, long restTotalStar, LocalDate restCreatedDate) {
        this.restNo = restNo;
        this.userNo = userNo;
        this.restName = restName;
        this.restAddress = restAddress;
        this.restContent = restContent;
        this.restPhone = restPhone;
        this.restCategory = restCategory;
        this.restOpenTime = restOpenTime;
        this.restCloseTime = restCloseTime;
        this.restReserv = restReserv;
        this.restReservTime = restReservTime;
        this.restTotalStar = restTotalStar;
        this.restCreatedDate = restCreatedDate;
    }

    public String getRestNo() {
        return restNo;
    }

    public void setRestNo(String restNo) {
        this.restNo = restNo;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    public String getRestName() {
        return restName;
    }

    public void setRestName(String restName) {
        this.restName = restName;
    }

    public String getRestAddress() {
        return restAddress;
    }

    public void setRestAddress(String restAddress) {
        this.restAddress = restAddress;
    }

    public String getRestContent() {
        return restContent;
    }

    public void setRestContent(String restContent) {
        this.restContent = restContent;
    }

    public String getRestPhone() {
        return restPhone;
    }

    public void setRestPhone(String restPhone) {
        this.restPhone = restPhone;
    }

    public String getRestCategory() {
        return restCategory;
    }

    public void setRestCategory(String restCategory) {
        this.restCategory = restCategory;
    }

    public String getRestOpenTime() {
        return restOpenTime;
    }

    public void setRestOpenTime(String restOpenTime) {
        this.restOpenTime = restOpenTime;
    }

    public String getRestCloseTime() {
        return restCloseTime;
    }

    public void setRestCloseTime(String restCloseTime) {
        this.restCloseTime = restCloseTime;
    }

    public String getRestReserv() {
        return restReserv;
    }

    public void setRestReserv(String restReserv) {
        this.restReserv = restReserv;
    }

    public String getRestReservTime() {
        return restReservTime;
    }

    public void setRestReservTime(String restReservTime) {
        this.restReservTime = restReservTime;
    }

    public long getRestTotalStar() {
        return restTotalStar;
    }

    public void setRestTotalStar(long restTotalStar) {
        this.restTotalStar = restTotalStar;
    }

    public LocalDate getRestCreatedDate() {
        return restCreatedDate;
    }

    public void setRestCreatedDate(LocalDate restCreatedDate) {
        this.restCreatedDate = restCreatedDate;
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "restNo='" + restNo + '\'' +
                ", userNo='" + userNo + '\'' +
                ", restName='" + restName + '\'' +
                ", restAddress='" + restAddress + '\'' +
                ", restContent='" + restContent + '\'' +
                ", restPhone='" + restPhone + '\'' +
                ", restCategory='" + restCategory + '\'' +
                ", restOpenTime='" + restOpenTime + '\'' +
                ", restCloseTime='" + restCloseTime + '\'' +
                ", restReserv='" + restReserv + '\'' +
                ", restReservTime='" + restReservTime + '\'' +
                ", restTotalStar='" + restTotalStar + '\'' +
                ", restCreatedDate=" + restCreatedDate +
                '}';
    }
}
