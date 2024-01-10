package com.sh.guys.review.model.dao;

import com.sh.guys.review.model.entity.ReviewComment;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;

public class ReviewCommentDaoTest {
    private  ReviewDao reviewDao;

    private SqlSession session;

    public void setUp() {
        this.reviewDao = new ReviewDao();
        this.session = getSqlSession();
    }

    @AfterEach
    public void tearDown() {
        this.session.rollback();
        this.session.close();
    }


    @DisplayName("특정리뷰에 대한 댓글 댓글조회")
    @Test
    public void test1() {
        String reviewComNo = "review_com001";
        List<ReviewComment> comments = reviewDao.findCommentByReviewNo(session, reviewComNo);
        assertThat(comments)
                .isNotNull()
                .allSatisfy(reviewComment -> {
                    assertThat(reviewComment.getNo()).isNotNull();
                    assertThat(reviewComment.getContent()).isNotNull();
                    assertThat(reviewComment.getRegDate()).isNotNull();
                });
    }

//    @DisplayName("리뷰댓글 등록")
//    @Test
//    public  void test2(){
////        ReviewComment reviewComment = new ReviewComment(null,"user066",  "review013", "감사합니다ㅎ", 1, null, null);
//    String no = "review051";
//    String usersNo ="users001";
//    String content = "감사합니다";
//    int commentLevel = 1;
//
//    ReviewComment comment = new ReviewComment();
//    comment.setReviewNo(no);
//    comment.setUsersNo(usersNo);
//    comment.setContent(content);
//    comment.setCommentLevel(commentLevel);
//
//        int result = ReviewDao.insertReviewComment(session, comment);
//        assertThat(result).isGreaterThan(0);
//        assertThat(comment.getNo()).isNotNull();
//
//        ReviewComment comment1 = reviewDao.findCommentByReviewNo(session, comment.getNo());
//        assertThat()
//







}
