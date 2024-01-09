package com.sh.guys.review.model.dao;

import com.sh.guys.review.model.entity.Review;
import com.sh.guys.user.model.dao.UserDao;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;

public class ReviewDaoTest {

    static final int limit = 10;

    ReviewDao reviewDao;
    SqlSession session;


    @BeforeEach
    void setUp() {
        // fixture 생성
        this.reviewDao = new ReviewDao();
        this.session = getSqlSession();
    }

    @AfterEach
    void tearDown() {
        this.session.rollback();
        this.session.close();
    }

    @DisplayName("리뷰글 전체 조회")
    @Test
    public void test1() {
        List<Review> reviews = reviewDao.findAll(session);
        // allSatisfy : 리스트의 각 요소가 모든 단정문을 충족하는지 확인
        assertThat(reviews)
                .isNotNull()
                .allSatisfy((review -> {
                    //pk 필수값 확인
                    assertThat(review.getNo()).isNotNull();
                    assertThat(review.getRestNo()).isNotNull();
                    assertThat(review.getUsersNo()).isNotNull();
                }));

    }

    @DisplayName("리뷰를 등록 할 수 있다.")
    @Test
    public void test2(){

    Review review = new Review(null, "restaurant018", "users001", "아주 굿이야 굿궁굿굿", 3,null );
    int result = reviewDao.insertReview(session, review);
        System.out.println(review);


        String no = review.getNo();
        Review review1 = reviewDao.findByNo(session, no);
        System.out.println(review1);
        //then
        assertThat(result).isGreaterThan(0);
        assertThat(no).isNotNull();
        assertThat(review1).satisfies((b)->{
           assertThat(b.getNo()).isNotNull();
           assertThat(b.getRestNo()).isNotNull();
           assertThat(b.getUsersNo()).isNotNull();

        });

    }

    @DisplayName("리뷰 수정 할 수 있습니다")
    @ParameterizedTest
    @ValueSource(strings = {"review015"})
    public void test3(String no){
        Review review = reviewDao.findByNo(session, no);
        assertThat(review).isNotNull();
        System.out.println(review);

        String newContent = "존맛";
        review.setContent(newContent);

        int result = reviewDao.updateReview(session, review);
        assertThat(result).isGreaterThan(0);

        Review reviewUpdated = reviewDao.findByNo(session, no);
        System.out.println(reviewUpdated);
        assertThat(reviewUpdated).satisfies((b) ->{
            assertThat(b.getContent()).isEqualTo(newContent);
        });
    }

    @DisplayName("리뷰 삭제")
    @ParameterizedTest
    @ValueSource(strings = {"review013"})
    public  void  test4(String no){
        Review review = reviewDao.findByNo(session, no);
        assertThat(review).isNotNull();

        int result = reviewDao.deleteReview(session, no);

        assertThat(result).isGreaterThan(0);
        Review reviewDeleted = reviewDao.findByNo(session, no);
        assertThat(reviewDeleted).isNull();
    }






}