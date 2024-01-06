package com.sh.guys.review.model.dao;

import com.sh.guys.review.model.entity.Review;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReviewDao {
    public List<Review> findAll(SqlSession session) {
        return session.selectList("reivew.findAll");
    }
}
