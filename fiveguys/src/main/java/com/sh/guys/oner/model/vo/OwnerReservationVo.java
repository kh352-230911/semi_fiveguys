package com.sh.guys.oner.model.vo;

import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.restaurant.model.entity.Restaurant;

import java.util.ArrayList;
import java.util.List;

public class OwnerReservationVo extends Restaurant {

    List<Reservation> reservations = new ArrayList<>();

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    @Override
    public String toString() {
        return "OwnerReservationVo{" +
                "reservations=" + reservations +
                "} " + super.toString();
    }
}