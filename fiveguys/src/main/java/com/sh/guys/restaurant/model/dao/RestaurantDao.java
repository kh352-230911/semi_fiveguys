package com.sh.guys.restaurant.model.dao;

import com.sh.guys.restaurant.model.entity.Restaurant;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class RestaurantDao {
    public List<Restaurant> findByCategory(SqlSession session, String restCategory) {
        return session.selectList("restaurant.findByCategory", restCategory);
    }
}
