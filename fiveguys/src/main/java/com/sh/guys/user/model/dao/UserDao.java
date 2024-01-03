package com.sh.guys.user.model.dao;

import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.entity.UserDel;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class UserDao {
    public int insertUser(SqlSession session, User user) {
        return session.insert("user.insertUser" , user);
    }

    public User findById(SqlSession session, String id) {
        return session.selectOne("user.findById", id);
    }

    public List<User> findAll(SqlSession session) {
        return session.selectList("user.findAll");
    }

    public List<User> findByName(SqlSession session, String name) {
        return session.selectList("user.findByName" , name);
    }

    public List<User> findByGender(SqlSession session, String gender) {
        return session.selectList("user.findByGender", gender);
    }

    public int updateUser(SqlSession session, User user) {
        return session.update("user.updateUser", user);
    }

    public int updateUserPassword(SqlSession session, User user) {
        return session.update("user.updateUserPassword", user);
    }

    public int updateUserRole(SqlSession session, User user) {
        return session.update("user.updateUserRole", user);
    }

    public int deleteUser(SqlSession session, String id) {
        return session.delete("user.deleteUser", id);
    }

    public List<UserDel> userDelFindAll(SqlSession session) {
        return session.selectList("userDel.userDelFindAll");
    }

    // 전체 게시물 조회 - 재준
    public int getTotalCount(SqlSession session) {
        return session.selectOne("user.getTotalCount");
    }

    // 페이지 별 게시물 조회 - 재준
    public List<User> findAllPage(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("user.findAllPage", param, rowBounds);
    }
}