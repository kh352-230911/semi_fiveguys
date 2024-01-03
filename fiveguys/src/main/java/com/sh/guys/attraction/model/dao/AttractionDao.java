package com.sh.guys.attraction.model.dao;

import com.sh.guys.attraction.model.entity.Attraction;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

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
}
