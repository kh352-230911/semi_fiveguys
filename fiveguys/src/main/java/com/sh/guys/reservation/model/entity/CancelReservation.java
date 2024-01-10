package com.sh.guys.reservation.model.entity;

import java.time.LocalDateTime;

public class CancelReservation extends Reservation {
    public CancelReservation() {
    }

    public CancelReservation(String no, String restNo, String usersNo, String reservName, String reservDate, String reservTime, int reservPeople, String request, LocalDateTime regDate, String reservPhone) {
        super(no, restNo, usersNo, reservName, reservDate, reservTime, reservPeople, request, regDate, reservPhone);
    }

    @Override
    public String toString() {
        return "CancelReservation{} " + super.toString();
    }
}