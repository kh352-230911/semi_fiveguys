package com.sh.guys.restaurant.model.vo;

import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.review.model.entity.Review;

import java.util.ArrayList;
import java.util.List;

public class StarAverageVo extends Restaurant {


    List<Review> reviews = new ArrayList<>();
    private double averageRating;

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    @Override
    public String toString() {
        return "StarAverageVo{" +
                "reviews=" + reviews +
                ", averageRating=" + averageRating +
                "} " + super.toString();
    }
}
