package com.sh.guys.attraction.model.dao;

import com.sh.guys.attraction.model.entity.Attraction;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.MethodSource;

import java.util.List;
import java.util.stream.Stream;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;

public class AttractionDaoTest {
    private AttractionDao attractionDao;
    private SqlSession session;

    public static Stream<Arguments> usersNoProvider() {
        AttractionDao attractionDao = new AttractionDao();
        List<Attraction> attractions = attractionDao.findAll(getSqlSession());
        return Stream.of(
                Arguments.arguments(attractions.get(0).getUsersNo()),
                Arguments.arguments(attractions.get(5).getUsersNo()),
                Arguments.arguments(attractions.get(6).getUsersNo())
        );
    }

    @BeforeEach
    public void setUp() {
        this.attractionDao = new AttractionDao();
        this.session = getSqlSession();
    }
    @AfterEach
    public void tearDown() {
        this.session.rollback();
        this.session.close();
    }

    @DisplayName("Wishdao, SqlSession은 null이 아니다.")
    @Test
    public void test(){
        assertThat(attractionDao).isNotNull();
        assertThat(session).isNotNull();
    }

    @DisplayName("좋아요 목록을 전체 조회 할 수 있다")
    @Test
    public void test1() {
        List<Attraction> attractions = attractionDao.findAll(session);
        System.out.println(attractions);
        assertThat(attractions).isNotNull()
                .allSatisfy((attraction) -> {
                   assertThat(attraction.getRestNo()).isNotNull();
                   assertThat(attraction.getUsersNo()).isNotNull();
                });
    }

    @DisplayName("회원 한 명의 좋아요 목록을 조회 할 수 있다")
    @ParameterizedTest
    @MethodSource("usersNoProvider")
    public void test2(String userNo) {
        List<Attraction> attractions = attractionDao.findByUserNo(session, userNo);
        System.out.println(attractions);
        assertThat(attractions)
                .isNotNull()
                .allSatisfy((attraction) -> {
                    assertThat(attraction.getUsersNo()).isNotNull();
                    assertThat(attraction.getRestNo()).isNotNull();
                });
    }

    @DisplayName("사용자는 하나의 캠핑장을 찜할 수 있습니다.")
    @Test
    public void test3() {
        String restNo = "restaurant043";
        String usersNo = "users001";
        Attraction attraction = new Attraction(usersNo, restNo);

        int result = attractionDao.insetAttraction(session, attraction);
        assertThat(result).isGreaterThan(0);

    }
}
