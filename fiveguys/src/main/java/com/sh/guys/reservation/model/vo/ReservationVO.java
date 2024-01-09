package com.sh.guys.reservation.model.vo;

import com.sh.guys.reservation.model.entity.Reservation;

import java.time.LocalDateTime;

public class ReservationVO extends Reservation {
    private String openTime;
    private String diffCount;
    private int count;

    public ReservationVO() {}

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getDiffCount() {
        return diffCount;
    }

    public void setDiffCount(String diffCount) {
        this.diffCount = diffCount;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "ReservationVO{" +
                "openTime='" + openTime + '\'' +
                ", diffCount='" + diffCount + '\'' +
                ", count=" + count +
                "} " + super.toString();
    }
}
