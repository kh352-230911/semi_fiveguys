package com.sh.guys.admin.model.service;

import com.mchange.io.impl.LazyReadOnlyMemoryFileImpl;
import com.sh.guys.admin.model.dao.AdminDao;
import com.sh.guys.admin.model.vo.UserVO;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class AdminService {
    private AdminDao adminDao = new AdminDao();

    // 전체 게시물 수 조회 - 재준
    public int getTotalCountUserList(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = adminDao.getTotalCountUserList(session);
        session.close();
        return totalCount;
    }

    // 페이지 별 게시물 조회 - 재준
    public List<User> findAllPageUserList(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<User> users = adminDao.findAllPageUserList(session, param);
        session.close();
        return users;
    }

    public int getTotalCountApprovalList(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = adminDao.getTotalCountApprovalList(session);
        session.close();
        return totalCount;
    }

    // 페이지 별 게시물 조회 - 재준
    public List<UserVO> findAllPageApprovalList(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<UserVO> usersVO = adminDao.findAllPageApprovalList(session, param);
        session.close();
        return usersVO;
    }

    public List<UserVO> findAllPageRestaurantList(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<UserVO> usersVO = adminDao.findAllPageRestaurantList(session, param);
        session.close();
        return usersVO;
    }

    public int getTotalCountRestaurantList(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = adminDao.getTotalCountRestaurantList(session);
        session.close();
        return totalCount;
    }

    public int updateRole(User user) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = adminDao.updateRole(session, user);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int updateApproval(Restaurant restaurant) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = adminDao.updateApproval(session, restaurant);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int deleteApproval(Restaurant restaurant) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = adminDao.deleteApproval(session, restaurant);
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
