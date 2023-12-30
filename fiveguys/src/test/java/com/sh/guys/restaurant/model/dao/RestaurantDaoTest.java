package com.sh.guys.restaurant.model.dao;

import com.sh.guys.restaurant.model.dao.RestaurantDao;
import com.sh.guys.restaurant.model.entity.Restaurant;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;

public class RestaurantDaoTest {
    RestaurantDao restaurantDao;
    SqlSession session;

    @BeforeEach
    void setUp() {
        this.restaurantDao = new RestaurantDao();
        this.session = getSqlSession();
    }

    @AfterEach
    void tearDown() {
        this.session.rollback();
        this.session.close();
    }

    // 식당을 등록 할 수 있습니다. - 우진
    @DisplayName("식당을 등록 할 수 있다.")
    @Test
    public void test1() {
        // pk : seq_tb_rest_no를 통해 채번
        Restaurant restaurant = new Restaurant(null, "user021", "식당 등록 테스트", "강남구 긴자료코","식당 등록 테스트입니다.",
                "02-1111-2222", "일식", "10:00", "22:00", null,  0, null);
        int result = restaurantDao.insertRestaurant(session, restaurant);
        System.out.println(restaurant);

        String no = restaurant.getNo();
        Restaurant restaurant1 = restaurantDao.findByNo(session, no);
        System.out.println(restaurant1);
        // then
        assertThat(result).isGreaterThan(0);
        assertThat(no).isNotNull();
        assertThat(restaurant1).satisfies((b) -> {
            assertThat(b.getNo()).isNotNull();
            assertThat(b.getUsersNo()).isNotNull();
            assertThat(b.getName()).isNotNull();
            assertThat(b.getAddress()).isNotNull();
            assertThat(b.getCategory()).isNotNull();
            assertThat(b.getPhone()).isNotNull();
            assertThat(b.getOpenTime()).isNotNull();
            assertThat(b.getCloseTime()).isNotNull();
            assertThat(b.getReservPossible()).isNotNull();
            assertThat(b.getRegDate()).isNotNull();
        });
    }

    // 식당 정보를 수정 할 수 있습니다. - 우진
    @DisplayName("식당 정보를 수정 할 수 있습니다.")
    @ParameterizedTest
    @ValueSource(strings = {"rest003"})
    public void test2(String no) {
        Restaurant restaurant = restaurantDao.findByNo(session, no);
        assertThat(restaurant).isNotNull();

        String newName = "새로운 식당 수정 테스트";
        String newAddress = "강남구 백소정";
        String newContent = "식당 수정 테스트입니다.";
        String newPhone = "02-1111-1111";
        restaurant.setName(newName);
        restaurant.setAddress(newAddress);
        restaurant.setContent(newContent);
        restaurant.setPhone(newPhone);

        int result = restaurantDao.updateRestaurant(session, restaurant);

        assertThat(result).isGreaterThan(0);
        Restaurant restaurantUpdated = restaurantDao.findByNo(session, no);
        assertThat(restaurantUpdated).satisfies((b) -> {
            System.out.println(restaurantUpdated);
           assertThat(b.getName()).isEqualTo(newName);
           assertThat(b.getAddress()).isEqualTo(newAddress);
           assertThat(b.getContent()).isEqualTo(newContent);
           assertThat(b.getPhone()).isEqualTo(newPhone);
        });
    }


    // 식당 삭제 - 우진
    @DisplayName("식당을 삭제 할 수 있다.")
    @ParameterizedTest
    @ValueSource(strings = {"rest002"})
    public void test3(String no) {
        Restaurant restaurant = restaurantDao.findByNo(session, no);
        assertThat(restaurant).isNotNull();

        int result = restaurantDao.deleteRestaurant(session, no);

        assertThat(result).isGreaterThan(0);
        Restaurant restaurantDeleted = restaurantDao.findByNo(session, no);
        assertThat(restaurantDeleted).isNull();
    }
}
