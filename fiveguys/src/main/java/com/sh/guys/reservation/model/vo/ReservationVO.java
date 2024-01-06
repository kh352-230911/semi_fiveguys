package com.sh.guys.reservation.model.vo;

import com.sh.guys.reservation.model.entity.Reservations;

import java.time.LocalDateTime;

public class ReservationVO extends Reservations {
    private String openTime;
    private String closeTime;
    private long diffTime;

    public ReservationVO() {}

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

    public long getDiffTime() {
        return diffTime;
    }

    public void setDiffTime(long diffTime) {
        this.diffTime = diffTime;
    }

    @Override
    public String toString() {
        return "ReservationVO{" +
                "openTime='" + openTime + '\'' +
                ", closeTime='" + closeTime + '\'' +
                ", diffTime='" + diffTime + '\'' +
                "} " + super.toString();
    }
}
