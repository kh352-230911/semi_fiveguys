package com.sh.guys.restaurant.model.dao;

import com.sh.guys.restaurant.model.entity.Restaurant;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class RestaurantDao {

    // 식당 한건 조회 - 우진
    public Restaurant findByNo(SqlSession session, String restNo) {
        return session.selectOne("restaurant.findByNo", restNo);
    }

    // 식당 모두 조회 - 우진
    public List<Restaurant> findAll(SqlSession session) {
        return session.selectList("restaurant.findAll");
    }

    // 식당 이름으로 식당 조회 - 우진
    public List<Restaurant> findByName(SqlSession session, String restName) {
        return session.selectList("restaurant.findByName", restName);
    }

    // 카테고리로 식당 조회 - 우진
    public List<Restaurant> findByCategory(SqlSession session, String restCategory) {
        return session.selectList("restaurant.findByCategory", restCategory);
    }

    // 식당을 등록 할 수 있습니다. - 우진
    public int insertRestaurant(SqlSession session, Restaurant restaurant) {
        return session.insert("restaurant.insertRestaurant", restaurant);
    }

    public int updateRestaurant(SqlSession session, Restaurant restaurant) {
        return session.update("restaurant.updateRestaurant", restaurant);
    }

    public int deleteRestaurant(SqlSession session, String restNo) {
        return session.delete("restaurant.deleteRestaurant", restNo);
    }
}
