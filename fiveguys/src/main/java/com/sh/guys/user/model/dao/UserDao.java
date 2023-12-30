package com.sh.guys.user.model.dao;

import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

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
}