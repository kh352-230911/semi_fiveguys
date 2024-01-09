package com.sh.guys.review.model.service;

import com.sh.guys.review.model.dao.ReviewDao;
import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.entity.ReviewComment;
import com.sh.guys.review.model.entity.ReviewPicture;
import com.sh.guys.review.vo.ReviewVo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class ReviewService {

    private ReviewDao reviewDao = new ReviewDao();

    public List<ReviewVo> findAll(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<ReviewVo> reviews = reviewDao.findAll(session, param);
        session.close();
        return reviews;
    }

    public List<Review> findAll() {
        SqlSession session = getSqlSession();
        List<Review> reviews = reviewDao.findAll(session);
        session.close();
        return reviews;
    }


    public int insertReview(ReviewVo review) {
        int result;
        SqlSession session = getSqlSession();
        try {
            result = reviewDao.insertReview(session, review);
            System.out.println("ReviewService#insertReview : review#no = " + review.getNo());

            List<ReviewPicture> reviewPictures = review.getReviewPictures();
            if (!reviewPictures.isEmpty()) {
                for (ReviewPicture picture : reviewPictures) {
                    picture.setReviewNo(review.getNo());
                    result = reviewDao.insertReviewPicture(session, picture);
                }
            }
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;

    }

    public int getTotalCount() {
        SqlSession session = getSqlSession();
        int totalCount = reviewDao.getTotalCount(session);
        session.close();
        return totalCount;
    }

    public ReviewVo findByNo(String no) {
        SqlSession session = getSqlSession();
        ReviewVo review = reviewDao.findByNo(session, no);
        session.close();
        return review;
    }

    public int insertReview(Review review) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = reviewDao.insertReview(session, review);
            session.commit();

        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public List<Review> findByRestNo(String restNo) {
        SqlSession session = getSqlSession();
        List<Review> reviews = reviewDao.findByRestNo(session, restNo);
        session.close();
        return reviews;
    }
//    public List<ReviewVo> findByRestNo(Map<String, Object> param) {
//        SqlSession session = getSqlSession();
//        List<ReviewVo> reviewVos = reviewDao.findByRestNo(session, param);
//        session.close();
//        return reviewVos;
//    }




    public int updateReview(Review review) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = reviewDao.updateReview(session, review);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }


    public int insertReviewComment(ReviewComment comment) {
        int result = 0;
        SqlSession session = getSqlSession();
        try{
            result = reviewDao.insertReviewComment(session, comment);
            session.commit();
        }catch (Exception e){
            session.rollback();
            throw e;
        }finally {
            session.close();
        }
        return  result;
    }
}
