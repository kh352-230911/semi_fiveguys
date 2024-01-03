package com.sh.guys.attraction.model.entity;

public class Attraction {
    private String usersNo;
    private String restNo;

    public Attraction() {
    }

    public Attraction(String usersNo, String restNo) {
        this.usersNo = usersNo;
        this.restNo = restNo;
    }

    public String getUsersNo() {
        return usersNo;
    }

    public void setUsersNo(String usersNo) {
        this.usersNo = usersNo;
    }

    public String getRestNo() {
        return restNo;
    }

    public void setRestNo(String restNo) {
        this.restNo = restNo;
    }

    @Override
    public String toString() {
        return "Wish{" +
                "usersNo='" + usersNo + '\'' +
                ", restNo='" + restNo + '\'' +
                '}';
    }
}
