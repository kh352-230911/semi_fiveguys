package com.sh.guys.attraction.model.service;

import com.sh.guys.attraction.model.dao.AttractionDao;
import com.sh.guys.attraction.model.entity.Attraction;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class AttractionService {
    private AttractionDao attractionDao = new AttractionDao();
    public int insertAttraction(Attraction attraction) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = attractionDao.insetAttraction(session, attraction);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public List<Attraction> findByUsersNoRestNo(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<Attraction> attractions = attractionDao.findByUsersNoRestNo(session, param);
        session.close();
        return attractions;
    }

    public int deleteAttraction(Attraction attraction) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = attractionDao.deleteAttraction(session, attraction);
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
