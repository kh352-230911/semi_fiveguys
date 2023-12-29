package com.sh.guys.user.model.service;

import com.sh.guys.user.model.dao.UserDao;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class UserService {
    private UserDao userDao = new UserDao();
    public User findById(String userId) {
        SqlSession session = getSqlSession();
        User user = userDao.findById(session, userId);
        session.close();
        return user;
    }

    public int insertUser(User user) {
        int result =0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.insertUser(session, user);
            session.commit();
        }catch (Exception e){
            session.rollback();
            throw e;
        }finally {
            session.close();
        }

        return result;
    }

    public List<User> findAll() {
        SqlSession session = getSqlSession();
        List<User> users = userDao.findAll(session);
        session.close();
        return users;
    }

    public List<User> findByName(String userName) {
        SqlSession session = getSqlSession();
        List<User> users = userDao.findByName(session, userName);
        session.close();
        return users;
    }

    public List<User> findByGender(String userGender) {
        SqlSession session = getSqlSession();
        List<User> users = userDao.findByGender(session, userGender);
        session.close();
        return users;
    }

    public int updateUser(User user) {
        int result =0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.updateUser(session, user);
            session.commit();
        }catch (Exception e){
            session.rollback();
            throw  e;
        }finally {
            session.close();
        }
        return  result;
    }

    public int updateUserPassword(User user) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = userDao.updateUserPassword(session, user);
            session.commit();
        }catch (Exception e){
            session.rollback();
            throw  e;
        }finally {
            session.close();
        }
        return result;
    }

    public int updateUserRole(User user) {
        int result = 0;
        SqlSession session = getSqlSession();
        try{
            result = userDao.updateUserRole(session, user);
            session.commit();
        }catch (Exception e){
            session.rollback();
            throw  e;
        }finally {
            session.close();
        }
        return result;
    }

    public int deleteUser(String userId) {
        int result = 0;
        SqlSession session = getSqlSession();
        try{
            result = userDao.deleteUSer(session, userId);
            session.commit();
        }catch (Exception e){
            session.rollback();
            throw  e;
        }finally {
            session.close();
        }
        return result;
    }
}
