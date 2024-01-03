package com.sh.guys.restaurant.model.service;

import com.sh.guys.admin.model.vo.UserVO;
import com.sh.guys.restaurant.model.dao.RestaurantDao;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class RestaurantService {
    private RestaurantDao restaurantDao = new RestaurantDao();

    // 식당 한건 조회 - 우진
    public Restaurant findByNo(String no) {
        SqlSession session = getSqlSession();
        Restaurant restaurant = restaurantDao.findByNo(session, no);
        session.close();
        return restaurant;
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


    public List<UserVO> findAllByAdmin(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<UserVO> usersVO = restaurantDao.findAllByAdmin(session, param);
        session.close();
        return usersVO;
    }

    public int getTotalCount(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = restaurantDao.getTotalCount(session);
        session.close();
        return totalCount;
    }
}
