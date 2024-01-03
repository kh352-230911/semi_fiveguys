package com.sh.guys.admin.model.dao;

import com.sh.guys.admin.model.vo.UserVO;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class AdminDao {
    // 전체 게시물 조회 - 재준
    public int getTotalCountUserList(SqlSession session) {
        return session.selectOne("admin.getTotalCountUserList");
    }

    // 페이지 별 게시물 조회 - 재준
    public List<User> findAllPageUserList(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("admin.findAllPageUserList", param, rowBounds);
    }

    // 전체 게시물 조회 - 재준
    public int getTotalCountApprovalList(SqlSession session) {
        return session.selectOne("admin.getTotalCountApprovalList");
    }

    // 페이지 별 게시물 조회 - 재준
    public List<UserVO> findAllPageApprovalList(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("admin.findAllPageApprovalList", param, rowBounds);
    }

    // 전체 게시물 조회 - 재준
    public int getTotalCountRestaurantList(SqlSession session) {
        return session.selectOne("admin.getTotalCountRestaurantList");
    }

    // 페이지 별 게시물 조회 - 재준
    public List<UserVO> findAllPageRestaurantList(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("admin.findAllPageRestaurantList", param, rowBounds);
    }

    public int updateRole(SqlSession session, User user) {
        return session.update("admin.updateRole", user);
    }

    public int updateApproval(SqlSession session, Restaurant restaurant) {
        return session.update("admin.updateApproval", restaurant);
    }
}
