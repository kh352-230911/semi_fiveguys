package com.sh.guys.reservation.model.entity;

import java.time.LocalDateTime;

public class CancelReservation extends Reservation {
    public CancelReservation() {
    }

    public CancelReservation(String no, String restNo, String usersNo, String reservName, LocalDateTime reservDate, LocalDateTime reservTime, int reservPeople, String request, LocalDateTime regDate) {
        super(no, restNo, usersNo, reservName, reservDate, reservTime, reservPeople, request, regDate);
    }

    @Override
    public String toString() {
        return "CancelReservation{} " + super.toString();
    }
}
