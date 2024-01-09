package com.sh.guys.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;

public class AdminApprovalOkDaoTest {
    private AdminDao adminDao;
    private SqlSession session;

    @BeforeEach
    public void setUp() {
        this.adminDao = new AdminDao();
        this.session = getSqlSession();
    }

    @AfterEach
    public void tearDown() {
        this.session.rollback();
        this.session.close();
    }

    @DisplayName("adminDao, session은 null이 아니다")
    @Test
    void test() {
        assertThat(adminDao).isNotNull();
        assertThat(session).isNotNull();
    }
}
