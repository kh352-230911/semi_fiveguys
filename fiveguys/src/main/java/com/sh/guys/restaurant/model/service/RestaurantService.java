package com.sh.guys.restaurant.model.service;

import com.sh.guys.restaurant.model.dao.RestaurantDao;
import com.sh.guys.restaurant.model.entity.Restaurant;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class RestaurantService {
    private RestaurantDao restaurantDao = new RestaurantDao();

    public List<Restaurant> findByCategory(String restCategory) {
        SqlSession session = getSqlSession();
        List<Restaurant> restaurants = restaurantDao.findByCategory(session, restCategory);
        session.close();
        return restaurants;
    }
}
