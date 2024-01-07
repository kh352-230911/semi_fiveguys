package com.sh.guys.reservation.model.vo;

import com.sh.guys.reservation.model.entity.Reservations;

import java.time.LocalDateTime;

public class ReservationVO extends Reservations {
    private String openTime;
    private String diffCount;

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

    @Override
    public String toString() {
        return "ReservationVO{" +
                "openTime='" + openTime + '\'' +
                ", diffCount='" + diffCount + '\'' +
                '}';
    }
}
