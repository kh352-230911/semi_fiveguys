package com.sh.guys.user.model.vo;

import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.review.model.entity.Review;
import com.sh.guys.user.model.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserReviewVo extends User {

    List<Restaurant> restaurants = new ArrayList<>();

    List<Review> reviews = new ArrayList<>();

    public List<Restaurant> getRestaurants() {
        return restaurants;
    }

    public void setRestaurants(List<Restaurant> restaurants) {
        this.restaurants = restaurants;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    @Override
    public String toString() {
        return "UserReviewVo{" +
                "restaurants=" + restaurants +
                ", reviews=" + reviews +
                "} " + super.toString();
    }
}
