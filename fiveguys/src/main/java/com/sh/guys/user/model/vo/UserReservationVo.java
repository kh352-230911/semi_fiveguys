package com.sh.guys.user.model.vo;

import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserReservationVo extends User {

    List<Reservation> reservations = new ArrayList<>();

    List<Restaurant> restaurants = new ArrayList<>();

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    public List<Restaurant> getRestaurants() {
        return restaurants;
    }

    public void setRestaurants(List<Restaurant> restaurants) {
        this.restaurants = restaurants;
    }

    @Override
    public String toString() {
        return "UserReservationVo{" +
                "reservations=" + reservations +
                ", restaurants=" + restaurants +
                "} " + super.toString();
    }
}
