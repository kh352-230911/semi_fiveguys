package com.sh.guys.review.model.dao;

import com.sh.guys.review.model.entity.Review;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReviewDao {
    public List<Review> findAll(SqlSession session) {
        return session.selectList("review.findAll");
    }

    public Review findByNo(SqlSession session, String reviewNo) {
        return session.selectOne("review.findByNo", reviewNo);
    }
}
