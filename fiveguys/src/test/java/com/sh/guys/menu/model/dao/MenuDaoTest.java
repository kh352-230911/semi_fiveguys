package com.sh.guys.menu.model.dao;

import com.sh.guys.menu.model.entity.Menu;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.Arguments;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.List;
import java.util.stream.Stream;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;
import static org.assertj.core.api.Assertions.assertThat;

public class MenuDaoTest {
    MenuDao menuDao;
    SqlSession session;

    @BeforeEach
    void setUp() {
        // fixture 생성
        this.menuDao = new MenuDao();
        this.session = getSqlSession();
    }

    @AfterEach
    void tearDown() {
        this.session.rollback();
        this.session.close();
    }

    // 메뉴 추가 - 재준
    @DisplayName("메뉴 등록")
    @ParameterizedTest
    @ValueSource(strings = "rest002")
    @Order(1)
    void test1(String restNo) {
        // given
        // when
        Menu menu = new Menu();
        menu.setRestNo(restNo);
        menu.setMenuName("순대");
        menu.setMenuContent("아침에 먹어도 맛있는 순대, 점심에 먹어도 맛있는 순대, 저녁에 먹어도 맛있는 순대, 냉장고에 넣었다 꺼내도 맛있는 순대, 차갑게 먹어도 맛있는 순대, 뜨거울때 먹어도 맛있는 순대, 새해에 먹는 맛있는 순대");
        menu.setMenuPrice(3500);

        int result = menuDao.insertMenu(session, menu);
        System.out.println(result);

        String menuNo = menu.getMenuNo();
        Menu menuInserted = menuDao.findByMenuNo(session, menuNo);
        System.out.println(menuInserted);

        // then
        assertThat(result).isGreaterThan(0);
        assertThat(menuNo).isNotNull();
        assertThat(menuInserted).satisfies((m) -> {
            assertThat(m.getRestNo()).isNotNull();
            assertThat(m.getMenuName()).isNotNull();
            assertThat(m.getMenuContent()).isNotNull();
            assertThat(m.getMenuPrice()).isNotZero();
            System.out.println(m);
        });
    }
    
    // 메뉴 수정 - 재준
    @DisplayName("메뉴 수정")
    @ParameterizedTest
    @ValueSource(strings = "menu001")
    @Order(2)
    void test2(String menuNo) {
        // given
        Menu menu = menuDao.findByMenuNo(session, menuNo);
        assertThat(menu).isNotNull();
        System.out.println(menu);

        // when
        menu.setMenuName("순대곱창");
        menu.setMenuContent("신림동 또순이 그 맛 그대로");
        menu.setMenuPrice(13000);
        int result = menuDao.updateMenu(session, menu);

        // then
        assertThat(result).isGreaterThan(0);
        Menu menuUpdated = menuDao.findByMenuNo(session, menuNo);
        assertThat(menuUpdated).satisfies((m) -> {
            assertThat(m.getRestNo()).isNotNull();
            assertThat(m.getMenuName()).isNotNull();
            assertThat(m.getMenuContent()).isNotNull();
            assertThat(m.getMenuPrice()).isNotZero();
            System.out.println(m);
        });
    }

    // 메뉴 삭제 - 재준
    @DisplayName("메뉴 삭제")
    @ParameterizedTest
    @ValueSource(strings = "menu001")
    @Order(3)
    void test3(String menuNo) {
        // given
        Menu menu = menuDao.findByMenuNo(session, menuNo);
        assertThat(menu).isNotNull();
        System.out.println(menu);

        // when
        int result = menuDao.deleteMenu(session, menuNo);

        // then
        assertThat(result).isGreaterThan(0);
        System.out.println(result);
        Menu menuDeleted = menuDao.findByMenuNo(session, menuNo);
        assertThat(menuDeleted).isNull();
        System.out.println(menuDeleted);
    }

    // menuNo를 순차적으로 공급해주는 메소드(메뉴 수정, 삭제 시 사용) - 재준
    public static Stream<Arguments> menuNoProvider() {
        MenuDao menuDao = new MenuDao();
        List<Menu> menus = menuDao.findMenuAll(getSqlSession());
        return Stream.of(
                Arguments.arguments(menus.get(0).getMenuNo()),
                Arguments.arguments(menus.get(1).getMenuNo())
        );
    }
}
