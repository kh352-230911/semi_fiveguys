package com.sh.guys.reservation.model.entity;

import java.time.LocalDateTime;

public class CancelReservations extends Reservations {
    public CancelReservations() {
    }

    public CancelReservations(String no, String restNo, String usersNo, String reservName, LocalDateTime reservDate, LocalDateTime reservTime, String reservPeople, String request, LocalDateTime regDate) {
        super(no, restNo, usersNo, reservName, reservDate, reservTime, reservPeople, request, regDate);
    }

    @Override
    public String toString() {
        return "CancelReservation{} " + super.toString();
    }
}
