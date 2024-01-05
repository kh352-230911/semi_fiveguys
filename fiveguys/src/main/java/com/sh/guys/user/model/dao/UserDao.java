package com.sh.guys.user.model.dao;

import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.entity.UserDel;
import com.sh.guys.user.model.vo.UserAttractionVo;
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

    public User findByNickName(SqlSession session, String nickName) {
        return session.selectOne("user.userfindByNickName", nickName);
    }

    public List<UserAttractionVo> findByNo(SqlSession session, String no) {
        return session.selectList("user.findByNo", no);
    }
}