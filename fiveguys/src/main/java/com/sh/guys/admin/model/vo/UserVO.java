package com.sh.guys.admin.model.vo;

import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.Gender;
import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;

import java.time.LocalDate;

public class UserVO extends User {
    private Restaurant restaurant;

    public UserVO() {}

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "restaurant=" + restaurant +
                "} " + super.toString();
    }
}
