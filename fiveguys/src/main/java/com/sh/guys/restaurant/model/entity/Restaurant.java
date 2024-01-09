package com.sh.guys.restaurant.model.entity;

import java.time.LocalDateTime;

public class Restaurant {
    private String no;
    private String usersNo;
    private String name;
    private String address;
    private String content;
    private String phone;
    private String category;
    private String openTime;
    private String closeTime;
    private Reservations reservPossible;
    private double totalStar;
    private LocalDateTime regDate;
    private Approval approval;

    public Restaurant() {
    }

    public Restaurant(String no, String usersNo, String name, String address, String content, String phone, String category, String openTime, String closeTime, Reservations reservPossible, double totalStar, LocalDateTime regDate, Approval approval) {
        this.no = no;
        this.usersNo = usersNo;
        this.name = name;
        this.address = address;
        this.content = content;
        this.phone = phone;
        this.category = category;
        this.openTime = openTime;
        this.closeTime = closeTime;
        this.reservPossible = reservPossible;
        this.totalStar = totalStar;
        this.regDate = regDate;
        this.approval = approval;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }

    public Reservations getReservPossible() {
        return reservPossible;
    }

    public void setReservPossible(Reservations reservPossible) {
        this.reservPossible = reservPossible;
    }

    public double getTotalStar() {
        return totalStar;
    }

    public void setTotalStar(double totalStar) {
        this.totalStar = totalStar;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    public Approval getApproval() {
        return approval;
    }

    public void setApproval(Approval approval) {
        this.approval = approval;
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "no='" + no + '\'' +
                ", usersNo='" + usersNo + '\'' +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", content='" + content + '\'' +
                ", phone='" + phone + '\'' +
                ", category='" + category + '\'' +
                ", openTime='" + openTime + '\'' +
                ", closeTime='" + closeTime + '\'' +
                ", reservPossible=" + reservPossible +
                ", totalStar=" + totalStar +
                ", regDate=" + regDate +
                ", approval=" + approval +
                '}';
    }
}

