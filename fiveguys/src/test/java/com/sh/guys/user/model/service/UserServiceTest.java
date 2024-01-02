package com.sh.guys.user.model.service;

import com.sh.guys.user.model.entity.Gender;
import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.entity.UserDel;
import org.junit.jupiter.api.*;


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

    @DisplayName("삭제/탈퇴 된 회원을 조회할 수 있다.")
    @Test
    public void test7() {
        List<UserDel> users = userService.userDelFindAll();
        System.out.println(users);

        assertThat(users).isNotNull()
                .allSatisfy((user) -> {
                   assertThat(user.getNo()).isNotNull();
                   assertThat(user.getId()).isNotNull();
                   assertThat(user.getPassword()).isNotNull();
                   assertThat(user.getName()).isNotNull();
                   assertThat(user.getNickName()).isNotNull();
                   assertThat(user.getEmail()).isNotNull();
                   assertThat(user.getRole()).isNotNull().isEqualTo(Role.U);
                });
    }
    @Disabled
    @DisplayName("관리자는 회원을 삭제할 수 있다.")
    @Test
    public void test8() {
        String id = "jklm";
        User user = userService.findById(id);
        assertThat(user).isNotNull();
        System.out.println(user);

        int result = userService.deleteUser(id);
        assertThat(result).isGreaterThan(0);

        User user1 = userService.findById(id);
        assertThat(user1).isNull();
    }

    @Disabled
    @DisplayName("관리자는 권한을 수정할 수 있다")
    @Test
    public void test9() {
        String id = "fghi";
        User user = userService.findById(id);
        assertThat(user).isNotNull();

        Role newRole = Role.O;
        user.setRole(newRole);

        int result = userService.updateUserRole(user);
        assertThat(result).isGreaterThan(0);

        User user1 = userService.findById(id);
        assertThat(user1).isNotNull();
        assertThat(user1.getRole()).isEqualTo(newRole);
    }
}