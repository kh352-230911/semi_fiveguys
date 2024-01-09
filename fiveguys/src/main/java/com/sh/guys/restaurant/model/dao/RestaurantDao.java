package com.sh.guys.restaurant.model.dao;

import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.convenience.model.vo.ConvenienceVo;
import com.sh.guys.restaurant.model.vo.RestaurantVo;
import com.sh.guys.restaurant.model.vo.StarAverageVo;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class RestaurantDao {
    // 식당 한건 조회 - 우진
    public RestaurantVo findByNo(SqlSession session, String no) {
        return session.selectOne("restaurant.findByNo", no);
    }

    // 식당 모두 조회 - 우진
    public List<Restaurant> findAll(SqlSession session) {
        return session.selectList("restaurant.findAll");
    }

    // 식당 이름으로 식당 조회 - 우진
    public List<Restaurant> findByName(SqlSession session, String name) {
        return session.selectList("restaurant.findByName", name);
    }

    // 카테고리로 식당 조회 - 우진
    public List<Restaurant> findByCategory(SqlSession session, String category) {
        return session.selectList("restaurant.findByCategory", category);
    }

    // 식당을 등록 할 수 있습니다. - 우진
    public int insertRestaurant(SqlSession session, Restaurant restaurant) {
        return session.insert("restaurant.insertRestaurant", restaurant);
    }

    public int updateRestaurant(SqlSession session, Restaurant restaurant) {
        System.out.println("dao");
        return session.update("restaurant.updateRestaurant", restaurant);
    }

    public int deleteRestaurant(SqlSession session, String no) {
        return session.delete("restaurant.deleteRestaurant", no);
    }

    public List<ConvenienceVo> findConven(SqlSession session, String no) {
        return session.selectList("restaurant.findConven", no);
    }

    public Restaurant findByPhone(SqlSession session, String phone) {
        return session.selectOne("restaurant.findByPhone", phone);
    }

    public List<StarAverageVo> findStarAverage(SqlSession session, String no) {
        return session.selectList("restaurant.starAverage", no);
    }

    public RestaurantVo findByUsersId(SqlSession session, String no) {
        return session.selectOne("restaurant.findByUsersId", no);
    }

    public Restaurant findByUsersNo(SqlSession session, String usersNo) {
        return session.selectOne("restaurant.findByUsersNo", usersNo);
    }

    public List<RestaurantVo> reservationFindAll(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        // 건너뛸 회원수
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("restaurant.reservationFindAllPage", param, rowBounds);
    }

    public int getTotalCount(SqlSession session, Map<String, Object> param) {
        return session.selectOne("restaurant.getTotalCount", param);
    }
}
