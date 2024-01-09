package com.sh.guys.user.model.service;

import com.sh.guys.user.model.dao.UserDao;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.entity.UserDel;
import com.sh.guys.user.model.vo.UserAttractionVo;
import com.sh.guys.user.model.vo.UserReservationVo;
import com.sh.guys.user.model.vo.UserReviewVo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class UserService {
    private UserDao userDao = new UserDao();

    public User findById(String id) {
        SqlSession session = getSqlSession();
        User user = userDao.findById(session, id);
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

    public List<User> findByName(String name) {
        SqlSession session = getSqlSession();
        List<User> users = userDao.findByName(session, name);
        session.close();
        return users;
    }

    public List<User> findByGender(String gender) {
        SqlSession session = getSqlSession();
        List<User> users = userDao.findByGender(session, gender);
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
        return result;
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

    public int deleteUser(String id) {
        int result = 0;
        SqlSession session = getSqlSession();
        try{
            result = userDao.deleteUser(session, id);
            session.commit();
        }catch (Exception e){
            session.rollback();
            throw  e;
        }finally {
            session.close();
        }
        return result;
    }


    public User logintest(String id, String password) {
        SqlSession session = getSqlSession();
        try {
            User user = userDao.findById(session, id);
            if (user != null && user.getPassword().equals(password)) {
                session.commit();
                return user;
            }
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return null;
    }

    public List<UserDel> userDelFindAll() {
        SqlSession session = getSqlSession();
        List<UserDel> users = userDao.userDelFindAll(session);
        session.close();
        return users;
    }

    public User finByNickName(String nickName) {
        SqlSession session = getSqlSession();
        User user = userDao.findByNickName(session, nickName);
        session.close();
        return user;
    }


    public List<UserAttractionVo> findByNo(String no) {
        SqlSession session = getSqlSession();
        List<UserAttractionVo> userAttractionVo = userDao.findByNo(session, no);
        session.close();
        return userAttractionVo;
    }

    public List<UserReservationVo> findReservation(String no) {
        SqlSession session = getSqlSession();
        List<UserReservationVo> userReservationVo = userDao.findReservation(session, no);
        session.close();
        return userReservationVo;
    }

    public List<UserReviewVo> findMyReview(String no) {
        SqlSession session = getSqlSession();
        List<UserReviewVo> userReviewVo = userDao.findMyReview(session, no);
        session.close();
        return userReviewVo;
    }

    public User findByUsersNo(String usersNo) {
        SqlSession session = getSqlSession();
        User user = userDao.findByUsersNo(session, usersNo);
        return user;
    }
}