package com.sh.guys.user.model.vo;

import com.sh.guys.attraction.model.entity.Attraction;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserAttractionVo extends User {
    List<Attraction> attractions = new ArrayList<>();

    List<Restaurant> restaurants = new ArrayList<>();

    public List<Attraction> getAttractions() {
        return attractions;
    }

    public void setAttractions(List<Attraction> attractions) {
        this.attractions = attractions;
    }

    public List<Restaurant> getRestaurants() {
        return restaurants;
    }

    public void setRestaurants(List<Restaurant> restaurants) {
        this.restaurants = restaurants;
    }

    @Override
    public String toString() {
        return "UserAttractionVo{" +
                "attractions=" + attractions +
                ", restaurants=" + restaurants +
                "} " + super.toString();
    }
}
