package com.sh.guys.review.model.service;

import com.sh.guys.review.model.entity.Review;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;


import java.util.List;


import static org.assertj.core.api.Assertions.assertThat;

public class ReviewServiceTest {
    static final int limit = 10;

    ReviewService reviewService;

    @BeforeEach
    void setUp() {
        this.reviewService = new ReviewService();
    }

    @DisplayName("리뷰 전체 조회")
    @Test
    public void test1() {

        List<Review> reviews = reviewService.findAll();

        assertThat(reviews)
                .isNotNull()
                .allSatisfy((review -> {
                    assertThat(review.getNo()).isNotNull();
                    assertThat(review.getUsersNo()).isNotNull();
                    assertThat(review.getRestNo()).isNotNull();
                    assertThat(review.getRegDate()).isNotNull();
                }));
    }
    @DisplayName("리뷰 조회")
    @Test
    public  void  test2(){
        Review review = reviewService.findByNo("review015");
        System.out.println(review);

        assertThat(review)
                .isNotNull()
                .satisfies((_review) -> {
                    // pk, 필수값 확인
                    assertThat(_review.getNo()).isNotNull();
                    assertThat(_review.getRestNo()).isNull();
                    assertThat(_review.getUsersNo()).isNotNull();
                });

    }



}