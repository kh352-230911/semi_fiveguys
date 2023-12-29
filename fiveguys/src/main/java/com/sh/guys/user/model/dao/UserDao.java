package com.sh.guys.user.model.dao;

import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserDao {
    public int insertUser(SqlSession session, User user) {
        return session.insert("user.insertUser" , user);
    }

    public User findById(SqlSession session, String userId) {
        return session.selectOne("user.findById", userId);
    }

    public List<User> findAll(SqlSession session) {
        return session.selectList("user.findAll");
    }

    public List<User> findByName(SqlSession session, String userName) {
        return session.selectList("user.findByName" , userName);
    }

    public List<User> findByGender(SqlSession session, String userGender) {
        return session.selectList("user.findByGender", userGender);
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

    public int deleteUSer(SqlSession session, String userId) {
        return session.delete("user.deleteUser", userId);
    }
}