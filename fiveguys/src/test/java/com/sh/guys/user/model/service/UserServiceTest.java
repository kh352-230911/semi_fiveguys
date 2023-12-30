package com.sh.guys.user.model.service;

import com.sh.guys.user.model.entity.Gender;
import com.sh.guys.user.model.entity.User;
import org.junit.jupiter.api.*;


import java.time.LocalDate;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class UserServiceTest {

    UserService userService;

    @BeforeEach
    void setUp() {
        this.userService = new UserService();
    }

    @Test
    void test() {
        assertThat(userService).isNotNull();
    }

    //   무진
    @DisplayName("존재하는 회원이 정상적으로 조회된다.")
    @Test
    public void test1() {
        User user = userService.findById("woojin");
        System.out.println(user);

        assertThat(user).isNotNull();
        //필드
        assertThat(user.getNo()).isNotNull();
        assertThat(user.getId()).isNotNull();
        assertThat(user.getPassword()).isNotNull();
        assertThat(user.getName()).isNotNull();
        assertThat(user.getNickName()).isNotNull();
        assertThat(user.getPhone()).isNotNull();

    }

    @DisplayName("존재하지않는 회원이 NULL이 반환되어야 한다.")
    @Test
    public void test2(){
        User user = userService.findById("askdgasiudgisa");
        assertThat(user).isNull();
    }

    @DisplayName("회원 전체 조회")
    @Test
    public void test3(){
        List<User> users = userService.findAll();
        assertThat(users)
                .isNotNull()
                .isNotEmpty();
        users.forEach((user) -> {
            System.out.println(user);

            assertThat(user.getNo()).isNotNull();
            assertThat(user.getId()).isNotNull();
            assertThat(user.getPassword()).isNotNull();
            assertThat(user.getName()).isNotNull();
            assertThat(user.getNickName()).isNotNull();
            assertThat(user.getPhone()).isNotNull();

        });
    }

    @DisplayName("회원 이름 검색")
    @Test
    public void test4() {
        String keyword = "우진";
        List<User> users = userService.findByName(keyword);
        assertThat(users)
                .isNotNull()
                .isNotEmpty();
        users.forEach((user) -> assertThat(user.getName()).contains(keyword));
    }

    @DisplayName("성별 검색")
    @Test
    public void test5() {
        String userGender = "M";
        List<User> users = userService.findByGender(userGender);
        assertThat(users)
                .isNotNull()
                .isNotEmpty();
        users.forEach((user) -> {
            assertThat(user.getGender()).isEqualTo(Gender.valueOf(userGender));
        });
    }

    @Test
    @DisplayName("로그인 성공 테스트")
    public void test6() {

        String id = "abcd";
        String password = "1234";

        User loginuser = userService.logintest(id, password);

        assertThat(loginuser).isNotNull();
        assertThat(loginuser.getId()).isEqualTo(id);
        assertThat(loginuser.getPassword()).isEqualTo(password);
    }
}