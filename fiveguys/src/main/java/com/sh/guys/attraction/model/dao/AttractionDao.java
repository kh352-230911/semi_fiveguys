package com.sh.guys.attraction.model.dao;

import com.sh.guys.attraction.model.entity.Attraction;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class AttractionDao {
    public List<Attraction> findAll(SqlSession session) {
        return session.selectList("attraction.findAll");
    }

    public List<Attraction> findByUserNo(SqlSession session, String userNo) {
        return session.selectList("attraction.findByUserNo", userNo);
    }

    public int insetAttraction(SqlSession session, Attraction attraction) {
        return session.insert("attraction.insertAttraction", attraction);
    }

    public List<Attraction> findByUsersNoRestNo(SqlSession session, Map<String, Object> param) {
        return session.selectList("attraction.findByUsersNoRestNo", param);
    }

    public int deleteAttraction(SqlSession session, Attraction attraction) {
        return session.delete("attraction.deleteAttraction", attraction);
    }
}
