package com.sh.guys.user.model.service;

import com.sh.guys.user.model.entity.Gender;
import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;


import java.time.LocalDate;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.catchThrowable;

public class UserServiceTest {

    UserService userService = new UserService();

//   무진
    @Disabled
    @Order(1)
    @DisplayName("회원가입")
    @Test
    public  void  test(){
        String userNO = null;
        String userId = "cjsanwls";
        String userPassword = "1234";
        String userName = "무진";

        User user = new User(userNO, userId, userPassword, userName, "무딘", Gender.M,"cmj0276@naver.com","01012341234",
                Role.U,null, null );

        int result = userService.insertUser(user);
        assertThat(result).isEqualTo(1);


        User user1 = userService.findById(userId);
        assertThat(user1).isNotNull();
        assertThat(user1.getUserId()).isEqualTo(userId);
        assertThat(user1.getUserPassword()).isEqualTo(userPassword);
        assertThat(user1.getUserName()).isEqualTo(userName);
    }
    @DisplayName("존재하는 회원이 정상적으로 조회된다.")
    @Test
    public  void test2() {
        User user = userService.findById("qwer");
        System.out.println(user);

        assertThat(user).isNotNull();
        //필드
        assertThat(user.getUserNo()).isNotNull();
        assertThat(user.getUserId()).isNotNull();
        assertThat(user.getUserPassword()).isNotNull();
        assertThat(user.getUserName()).isNotNull();
        assertThat(user.getUserNickName()).isNotNull();
        assertThat(user.getUserPhone()).isNotNull();

    }

    @DisplayName("존재하지않는 회원이 NULL이 반환되어야 한다.")
    @Test
    public  void  test3(){
        User user = userService.findById("askdgasiudgisa");
        assertThat(user).isNull();
    }

    @DisplayName("회원 전체 조회")
    @Test
    public  void  test4(){
        List<User> users = userService.findAll();
        assertThat(users)
                .isNotNull()
                .isNotEmpty();
        users.forEach((user) -> {
            System.out.println(user);

            assertThat(user.getUserNo()).isNotNull();
            assertThat(user.getUserId()).isNotNull();
            assertThat(user.getUserPassword()).isNotNull();
            assertThat(user.getUserName()).isNotNull();
            assertThat(user.getUserNickName()).isNotNull();
            assertThat(user.getUserPhone()).isNotNull();

        });
    }

    @DisplayName("회원 이름 검색")
    @Test
    public  void  test5(){
        String keyword = "우진";
        List<User> users = userService.findByName(keyword);
        assertThat(users)
                .isNotNull()
                .isNotEmpty();
        users.forEach((user) -> assertThat(user.getUserName()).contains(keyword));
    }

    @DisplayName("성별 검색")
    @Test
    public  void  test6(){
        String userGender = "M";
        List<User> users = userService.findByGender(userGender);
        assertThat(users)
                .isNotNull()
                .isNotEmpty();
        users.forEach((user) -> {
            assertThat(user.getUserGender()).isEqualTo(Gender.valueOf(userGender));
        });
    }

    @Disabled
    @Order(2)
    @DisplayName("회원가입시 오류 체크")
    @Test
    public  void test8(){
        User user = new User(null, "aaaa", null, "가나다", "라마바", Gender.M,"cmj0276@naver.com","01012341234",
                Role.U,null, null );
        Throwable th = catchThrowable(() -> {
            int result = userService.insertUser(user);
        });
        assertThat(th).isInstanceOf(Exception.class);
    }
    @Disabled
    @Order(3)
    @DisplayName("회원정보 수정")
    @Test
    public  void  test9(){
        //주어진 상황
        String userId = "qwer";
        User user = userService.findById(userId);

        // 업무로직 작성 (바뀔내용)
        String newName =  "손흥민";
        Gender newGender = null;
        String newEmail = "qwer@gmail.com";
        String newPhone = "0101111222";
        String newNickName = "슛돌이";

        user.setUserName(newName);
        user.setUserGender(newGender);
        user.setUserEmail(newEmail);
        user.setUserPhone(newPhone);
        user.setUserNickName(newNickName);

        int result = userService.updateUser(user);
        assertThat(result).isGreaterThan(0);

        // 검증
        User user2 = userService.findById(userId);
        System.out.println(user2);
        assertThat(user2.getUserName()).isEqualTo(newName);
        assertThat(user2.getUserGender()).isEqualTo(newGender);
        assertThat(user2.getUserEmail()).isEqualTo(newEmail);
        assertThat(user2.getUserPhone()).isEqualTo(newPhone);
        assertThat(user2.getUserNickName()).isEqualTo(newNickName);

    }
    @Disabled
    @Order(4)
    @DisplayName("회원 비밀번호 수정")
    @Test
    public  void  test10(){
        String userId = "qwer";
        User user = userService.findById(userId);
        String newPassword = "qwer1234";
        user.setUserPassword(newPassword);

        int result = userService.updateUserPassword(user);

        assertThat(result).isGreaterThan(0);
        User user2 = userService.findById(userId);
        System.out.println(user2);
        assertThat(user2.getUserPassword()).isEqualTo(newPassword);

    }
    @Disabled
    @Order(5)
    @DisplayName("회원 권한 수정")
    @Test
    public  void test11() {
        String userId = "qwer";
        User user = userService.findById(userId);
        Role newRole = Role.M;
        user.setUserRole(newRole);

        int result = userService.updateUserRole(user);

        assertThat(result).isGreaterThan(0);
        User user2 = userService.findById(userId);
        assertThat(user2.getUserRole().name()).isEqualTo(newRole.name());
    }
    @Disabled
    @Order(6)
    @DisplayName("회원삭제")
    @Test
    public  void  test12(){
        String userId = "cjsanwls";
        User user = userService.findById(userId);
        assertThat(user).isNotNull();

        int result = userService.deleteUser(userId);
        assertThat(result).isGreaterThan(0);

        User user2 = userService.findById(userId);
        assertThat(user2).isNull();
    }

}

