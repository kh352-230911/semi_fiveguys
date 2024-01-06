package com.sh.guys.user.model.vo;

import com.sh.guys.reservation.model.entity.Reservations;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserReservationVo extends User {

    List<Reservations> reservations = new ArrayList<>();

    List<Restaurant> restaurants = new ArrayList<>();

    public List<Reservations> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservations> reservations) {
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
