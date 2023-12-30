package com.sh.guys.user.model.dao;

import com.sh.guys.menu.model.dao.MenuDao;
import com.sh.guys.user.model.entity.Gender;
import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.service.UserService;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.*;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.catchThrowable;

public class UserDaoTest {

    UserDao userDao;
    SqlSession session = getSqlSession();

    @BeforeEach
    void setUp() {
        // fixture 생성
        this.userDao = new UserDao();
        this.session = getSqlSession();
    }

    @AfterEach
    void tearDown() {
        this.session.rollback();
        this.session.close();
    }

//   무진
    @Disabled
    @Order(1)
    @DisplayName("회원가입")
    @Test
    public void test1(){
        String no = null;
        String id = "cjsanwls";
        String password = "1234";
        String name = "무진";

        User user = new User(no, id, password, name, "무딘", Gender.M,"cmj0276@naver.com","01012341234",
                Role.U,null, null );

        int result = userDao.insertUser(session, user);
        assertThat(result).isEqualTo(1);


        User user1 = userDao.findById(session, id);
        assertThat(user1).isNotNull();
        assertThat(user1.getId()).isEqualTo(id);
        assertThat(user1.getPassword()).isEqualTo(password);
        assertThat(user1.getName()).isEqualTo(name);
    }

    @Disabled
    @Order(2)
    @DisplayName("회원가입시 오류 체크")
    @Test
    public void test2(){
        User user = new User(null, "aaaa", null, "가나다", "라마바", Gender.M,"cmj0276@naver.com","01012341234",
                Role.U,null, null );
        Throwable th = catchThrowable(() -> {
            int result = userDao.insertUser(session, user);
            assertThat(result).isZero();
        });
        assertThat(th).isInstanceOf(Exception.class);
    }

    @Disabled
    @Order(3)
    @DisplayName("회원정보 수정")
    @Test
    public void test3(){
        //주어진 상황
        String id = "qwer";
        User user = userDao.findById(session, id);

        // 업무로직 작성 (바뀔내용)
        String newName =  "손흥민";
        Gender newGender = null;
        String newEmail = "qwer@gmail.com";
        String newPhone = "0101111222";
        String newNickName = "슛돌이";

        user.setName(newName);
        user.setGender(newGender);
        user.setEmail(newEmail);
        user.setPhone(newPhone);
        user.setNickName(newNickName);

        int result = userDao.updateUser(session, user);
        assertThat(result).isGreaterThan(0);

        // 검증
        User user2 = userDao.findById(session, id);
        System.out.println(user2);
        assertThat(user2.getName()).isEqualTo(newName);
        assertThat(user2.getGender()).isEqualTo(newGender);
        assertThat(user2.getEmail()).isEqualTo(newEmail);
        assertThat(user2.getPhone()).isEqualTo(newPhone);
        assertThat(user2.getNickName()).isEqualTo(newNickName);
    }

    @Disabled
    @Order(4)
    @DisplayName("회원 비밀번호 수정")
    @Test
    public void test4() {
        String id = "qwer";
        User user = userDao.findById(session, id);
        String newPassword = "qwer1234";
        user.setPassword(newPassword);

        int result = userDao.updateUserPassword(session, user);

        assertThat(result).isGreaterThan(0);
        User user2 = userDao.findById(session, id);
        System.out.println(user2);
        assertThat(user2.getPassword()).isEqualTo(newPassword);
    }

    @Disabled
    @Order(5)
    @DisplayName("회원 권한 수정")
    @Test
    public void test5() {
        String id = "qwer";
        User user = userDao.findById(session, id);
        Role newRole = Role.M;
        user.setRole(newRole);

        int result = userDao.updateUserRole(session, user);

        assertThat(result).isGreaterThan(0);
        User user2 = userDao.findById(session, id);
        assertThat(user2.getRole().name()).isEqualTo(newRole.name());
    }

    @Disabled
    @Order(6)
    @DisplayName("회원삭제")
    @Test
    public void test6(){
        String id = "cjsanwls";
        User user = userDao.findById(session, id);
        assertThat(user).isNotNull();

        int result = userDao.deleteUser(session, id);
        assertThat(result).isGreaterThan(0);

        User user2 = userDao.findById(session, id);
        assertThat(user2).isNull();
    }
}

