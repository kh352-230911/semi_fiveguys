package com.sh.guys.review.model.service;

import com.sh.guys.review.model.dao.ReviewDao;
import com.sh.guys.review.model.entity.Review;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class ReviewService {

    private ReviewDao reviewDao = new ReviewDao();

    public List<Review> findAll() {
        SqlSession session = getSqlSession();
        List<Review> reviews = reviewDao.findAll(session);
        session.close();
        return reviews;
    }

    // github
    public int reviewDelete(String reviewNo) {
        SqlSession session = getSqlSession();
        int result = 0;
        try{
            result = reviewDao.reviewDelete(session, reviewNo);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }
    // end
}
