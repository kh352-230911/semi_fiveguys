package com.sh.guys.restaurant.model.service;

import com.sh.guys.restaurant.model.dao.RestaurantDao;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.convenience.model.vo.ConvenienceVo;
import com.sh.guys.restaurant.model.vo.RestaurantVo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class RestaurantService {
    private RestaurantDao restaurantDao = new RestaurantDao();

    // 식당 한건 조회 - 우진
    public RestaurantVo findByNo(String no) {
        SqlSession session = getSqlSession();
        RestaurantVo restaurantVo = restaurantDao.findByNo(session, no);
        session.close();
        return restaurantVo;
    }

    // 식당 여러 건 조회 - 우진
    public List<Restaurant> findAll() {
        SqlSession session = getSqlSession();
        List<Restaurant> restaurants = restaurantDao.findAll(session);
        session.close();
        return restaurants;
    }

    // 식당 이름으로 식당 조회 - 우진
    public List<Restaurant> findByName(String name) {
        SqlSession session = getSqlSession();
        List<Restaurant> restaurants = restaurantDao.findByName(session, name);
        session.close();
        return restaurants;
    }

    // 카테고리로 식당 조회 - 우진
    public List<Restaurant> findByCategory(String category) {
        SqlSession session = getSqlSession();
        List<Restaurant> restaurants = restaurantDao.findByCategory(session, category);
        session.close();
        return restaurants;
    }

    public List<ConvenienceVo> findConven(String no) {
        SqlSession session = getSqlSession();
        List<ConvenienceVo> convenienceVos = restaurantDao.findConven(session, no);
        session.close();
        return convenienceVos;
    }

    public int insertRestaurant(Restaurant restaurant) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = restaurantDao.insertRestaurant(session, restaurant);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public Restaurant findByPhone(String phone) {
        SqlSession session = getSqlSession();
        Restaurant restaurant = restaurantDao.findByPhone(session, phone);
        session.close();
        return restaurant;
    }

    public int updateRestaurant(Restaurant restaurant) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = restaurantDao.updateRestaurant(session, restaurant);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }
}
