package com.sh.guys.restaurant.model.service;

import com.sh.guys.restaurant.model.entity.Restaurant;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class RestaurantServiceTest {
    private RestaurantService restaurantService;

    @BeforeEach
    @Test
    public void setUp() {
        this.restaurantService = new RestaurantService();
    }

    @DisplayName("RestaurantService는 null이 아니다.")
    @Test
    public void test() {
        assertThat(restaurantService).isNotNull();
    }

    @DisplayName("식당 카테고리 검색으로 식당을 조회 할 수 있다.")
    @Test
    public void test1() {
        String restCategory = "it";
        List<Restaurant> restaurants = restaurantService.findByCategory(restCategory);
        System.out.println(restaurants);

//        assertThat(restaurants)
//                .isNotNull()
//                .allSatisfy((restaurant) -> {
//                   assertThat(restaurant.getNo()).isNotNull();
//                   assertThat(restaurant.getUserNo()).isNotNull();
//                   assertThat(restaurant.getRestName()).isNotNull();
//                   assertThat(restaurant.getRestCategory()).contains(restCategory);
//                });
    }
}
