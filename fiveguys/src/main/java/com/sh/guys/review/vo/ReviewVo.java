package com.sh.guys.review.vo;

import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.entity.ReviewComment;
import com.sh.guys.review.model.entity.ReviewPicture;
import com.sh.guys.user.model.entity.User;

import java.util.ArrayList;
import java.util.List;

public class ReviewVo extends Review {

    private User user;
    private Restaurant restaurant;
    private int reviewCount;
    private List<ReviewPicture> reviewPictures = new ArrayList<>();
    private List<Long> delFiles = new ArrayList<>();
    private List<ReviewComment> reviewComments;

    private int commentCount;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public int getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }

    public List<ReviewPicture> getReviewPictures() {
        return reviewPictures;
    }

    public void setReviewPictures(List<ReviewPicture> reviewPictures) {
        this.reviewPictures = reviewPictures;
    }

    public List<Long> getDelFiles() {
        return delFiles;
    }

    public void setDelFiles(List<Long> delFiles) {
        this.delFiles = delFiles;
    }

    public void addReviewComment(ReviewComment reviewComment) {
        this.reviewComments.add(reviewComment);
    }

    public List<ReviewComment> getReviewComments() {
        return reviewComments;
    }

    public void setReviewComments(List<ReviewComment> reviewComments) {
        this.reviewComments = reviewComments;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public void setValue(String name, String value) {
        switch (name) {
            case "restNo": setRestNo(value);break;
            case "usersNo": setUsersNo(value);break;
            case "content": setContent(value);break;
            case "revScore": setStarGrade(Double.parseDouble(value));break;
            case "delFile": this.delFiles.add(Long.parseLong(value));break;
            default: throw new RuntimeException("부적절한 name값 : " + name);
        }
    }

    @Override
    public String toString() {
        return "ReviewVo{" +
                "user=" + user +
                ", restaurant=" + restaurant +
                ", reviewCount=" + reviewCount +
                ", reviewPictures=" + reviewPictures +
                ", delFiles=" + delFiles +
                ", reviewComments=" + reviewComments +
                ", commentCount=" + commentCount +
                "} " + super.toString();
    }

    public void addReviewPicture(ReviewPicture reviewPicture) {
        this.reviewPictures.add(reviewPicture);
    }
}
