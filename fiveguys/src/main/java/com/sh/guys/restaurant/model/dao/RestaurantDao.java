package com.sh.guys.restaurant.model.dao;

import com.sh.guys.admin.model.vo.UserVO;
import com.sh.guys.restaurant.model.entity.Restaurant;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class RestaurantDao {
    // 식당 한건 조회 - 우진
    public Restaurant findByNo(SqlSession session, String no) {
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
        return session.update("restaurant.updateRestaurant", restaurant);
    }

    public int deleteRestaurant(SqlSession session, String no) {
        return session.delete("restaurant.deleteRestaurant", no);
    }

    public List<UserVO> findAllByAdmin(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("restaurant.findAllByAdmin", param, rowBounds);
    }

    public int getTotalCount(SqlSession session) {
        return session.selectOne("restaurant.getTotalCount");
    }
}
