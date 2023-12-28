package com.sh.guys.menu.model;

import com.sh.guys.menu.model.service.MenuService;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;

public class ModelServiceTest {
    MenuService menuService;
    SqlSession session;

    @BeforeEach
    public void setUp() {
        // fixture 생성
        this.menuService = new MenuService();
        this.session = getSqlSession();
    }

    @AfterEach
    public void tearDown() {
        // fixture 객체
        // session rollback 처리
        this.session.rollback();
        this.session.close();
    }

    @Test
    public void test() {
        assertThat(menuService).isNotNull();
        assertThat(session).isNotNull();
    }

    @Test
    public void test1() {

    }
}
