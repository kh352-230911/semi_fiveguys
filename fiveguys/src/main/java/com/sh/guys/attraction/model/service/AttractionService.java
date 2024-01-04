package com.sh.guys.attraction.model.service;

import com.sh.guys.attraction.model.dao.AttractionDao;
import com.sh.guys.attraction.model.entity.Attraction;
import org.apache.ibatis.session.SqlSession;

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
}
