package com.sh.guys.oner.model.dao;

import com.sh.guys.restaurant.model.entity.Restaurant;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class OnerDao {
    public List<Restaurant> findMyRestaurant(SqlSession session, String userNo) {
        return session.selectList("oner.findMyRestaurant", userNo);
    }
}
