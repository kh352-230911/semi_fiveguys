package com.sh.guys.review.model.dao;

import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.entity.ReviewComment;
import com.sh.guys.review.model.entity.ReviewPicture;
import com.sh.guys.review.vo.ReviewVo;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class ReviewDao {

    public List<Review> findAll(SqlSession session) {
        return session.selectList("review.findAll");
    }

    public int insertReview(SqlSession session, Review review) {
        return session.insert("review.insertReview" , review);
    }



    public int getTotalCount(SqlSession session) {
        return session.selectOne("review.getTotalCount");
    }

    public ReviewVo findByNo(SqlSession session, String no) {
        return session.selectOne("review.findByNo" , no);
    }

    public List<ReviewVo> findAll(SqlSession session, Map<String, Object> param) {
        return session.selectList("review.findAll");
    }

    public int updateReview(SqlSession session, Review review) {
        return session.update("review.updateReview", review);
    }

    public int deleteReview(SqlSession session, String no) {
        return  session.delete("review.deleteReview", no);
    }

    public List<Review> findByRestNo(SqlSession session, String restNo) {
        return session.selectList("review.findByRestNo" , restNo);
    }


    public List<ReviewComment> findCommentByReviewNo(SqlSession session, String reviewComNo) {
        return session.selectList("review.findCommentByReviewNo", reviewComNo);
    }

    public int insertReviewPicture(SqlSession session, ReviewPicture picture) {
        return session.insert("review.insertReviewPicture", picture);
    }

    public int insertReviewComment(SqlSession session, ReviewComment comment) {
        return session.insert("review.insertReviewComment", comment);
    }


//    public List<ReviewVo> findByRestNo(SqlSession session,Map<String, Object> param) {
//        int page = (int) param.get("page");
//        int limit = (int) param.get("limit");
//        int offset = (page - 1) * limit;
//        RowBounds rowBounds = new RowBounds(offset, limit);
//        return session.selectList("review.findByRestNo" , param ,   rowBounds);
//    }
}
