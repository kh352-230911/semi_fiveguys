package com.sh.guys.restaurant.model.service;

import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class RestaurantServiceTest {

    RestaurantService restaurantService;

    @BeforeEach
    public void beforeEach() {
        this.restaurantService = new RestaurantService();
    }

    @DisplayName("RestaurantService객체는 null이 아니다.")
    @Test
    public void test1() {
        assertThat(restaurantService).isNotNull();
    }

    // 식당 한건 조회 - 우진
    @DisplayName("존재하는 식당이 정상적으로 조회된다.")
    @Test
    public void test2() {
        Restaurant restaurant = restaurantService.findByNo("rest013");
        System.out.println(restaurant);
        // 객체
        assertThat(restaurant).isNotNull();
        assertThat(restaurant.getNo()).isNotNull();
        assertThat(restaurant.getUsersNo()).isNotNull();
        assertThat(restaurant.getName()).isNotNull();
        assertThat(restaurant.getAddress()).isNotNull();
        assertThat(restaurant.getCategory()).isNotNull();
        assertThat(restaurant.getPhone()).isNotNull();
        assertThat(restaurant.getOpenTime()).isNotNull();
        assertThat(restaurant.getCloseTime()).isNotNull();
        assertThat(restaurant.getReservPossible()).isNotNull();
        assertThat(restaurant.getRegDate()).isNotNull();

    }

    // 식당 존재하지 않는 값 조회x - 우진
    @DisplayName("존재하지 않는 식당은 조회되지 않는다.")
    @Test
    public void test3 () {
        Restaurant restaurant = restaurantService.findByNo("rest00000121");
        assertThat(restaurant).isNull();
    }

    // 식당 여러 건 조회 - 우진
    @DisplayName("모든 식당들을 조회 할 수 있다.")
    @Test
    public void test4 () {
        List<Restaurant> restaurants = restaurantService.findAll();
        assertThat(restaurants).isNotEmpty().isNotNull();

    restaurants.forEach((restaurant) -> {
        System.out.println(restaurant);
        assertThat(restaurant.getNo()).isNotNull();
        assertThat(restaurant.getUsersNo()).isNotNull();
        assertThat(restaurant.getName()).isNotNull();
        assertThat(restaurant.getAddress()).isNotNull();
        assertThat(restaurant.getCategory()).isNotNull();
        assertThat(restaurant.getPhone()).isNotNull();
        assertThat(restaurant.getOpenTime()).isNotNull();
        assertThat(restaurant.getCloseTime()).isNotNull();
        assertThat(restaurant.getReservPossible()).isNotNull();
        assertThat(restaurant.getRegDate()).isNotNull();
    });

    }

    // 식당 이름으로 식당 조회 - 우진
    @DisplayName("식당 이름으로 식당을 검색 할 수 있다.")
    @Test
    public void test5 () {
        List<Restaurant> restaurants = restaurantService.findByName("캐치");
        assertThat(restaurants).isNotNull().isNotEmpty();

    restaurants.forEach((restaurant) -> {
        System.out.println(restaurant);
        assertThat(restaurant.getNo()).isNotNull();
        assertThat(restaurant.getUsersNo()).isNotNull();
        assertThat(restaurant.getName()).isNotNull();
        assertThat(restaurant.getAddress()).isNotNull();
        assertThat(restaurant.getCategory()).isNotNull();
        assertThat(restaurant.getPhone()).isNotNull();
        assertThat(restaurant.getOpenTime()).isNotNull();
        assertThat(restaurant.getCloseTime()).isNotNull();
        assertThat(restaurant.getReservPossible()).isNotNull();
        assertThat(restaurant.getRegDate()).isNotNull();
    });
    }

    // 카테고리로 식당 조회 - 우진
    @DisplayName("카테고리로 식당 조회")
    @Test
    public void test6 () {
        List<Restaurant> restaurants = restaurantService.findByCategory("it");
        assertThat(restaurants).isNotNull().isNotEmpty();

        restaurants.forEach((restaurant) -> {
            System.out.println(restaurant);
            assertThat(restaurant.getNo()).isNotNull();
            assertThat(restaurant.getUsersNo()).isNotNull();
            assertThat(restaurant.getName()).isNotNull();
            assertThat(restaurant.getAddress()).isNotNull();
            assertThat(restaurant.getCategory()).isNotNull();
            assertThat(restaurant.getPhone()).isNotNull();
            assertThat(restaurant.getOpenTime()).isNotNull();
            assertThat(restaurant.getCloseTime()).isNotNull();
            assertThat(restaurant.getReservPossible()).isNotNull();
            assertThat(restaurant.getRegDate()).isNotNull();
        });
    }

}

