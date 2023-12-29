package com.sh.guys.menu.model.service;

import com.sh.guys.menu.model.entity.Menu;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class MenuServiceTest {
    MenuService menuService;
    SqlSession session;

    @BeforeEach
    public void setUp() {
        // fixture 생성
        this.menuService = new MenuService();
    }

    @Test
    public void test() {
        assertThat(menuService).isNotNull();
    }

    // 메뉴 전체 조회 - 재준
    @DisplayName("Menu 전체조회")
    @Test
    void test1() {
        // given
        // when
        List<Menu> menus = menuService.findMenuAll();
        // then
        assertThat(menus)
                .isNotNull()
                .allSatisfy((menu) -> {
                    assertThat(menu.getMenuNo()).isNotNull();
                    assertThat(menu.getRestNo()).isNotNull();
                    assertThat(menu.getMenuName()).isNotNull();
                    assertThat(menu.getMenuContent()).isNotNull();
                    assertThat(menu.getMenuPrice()).isNotZero();
                    System.out.println(menu);
                });
    }

    // 메뉴 식별번호로 존재하는 메뉴 한개 조회 - 재준
    @DisplayName("존재하는 메뉴 한개 조회")
    @Test
    void test2_1() {
        // given
        String menuNo = "menu022";
        // when
        Menu menu = menuService.findByMenuNo(menuNo);
        // then
        assertThat(menu)
                .isNotNull()
                .satisfies((_menu) -> {
                    assertThat(_menu.getMenuNo()).isNotNull();
                    assertThat(_menu.getRestNo()).isNotNull();
                    assertThat(_menu.getMenuName()).isNotNull();
                    assertThat(_menu.getMenuContent()).isNotNull();
                    assertThat(_menu.getMenuPrice()).isNotZero();
                    System.out.println(menu);
                });
    }

    // 메뉴 식별번호로 존재하지 않는 메뉴 조회 - 재준
    @DisplayName("존재하지 않는 메뉴 한건 조회")
    @ParameterizedTest
    @ValueSource(strings = {"menu100000", "menu200000"})
    void test2_2(String menuNo) {
        // given
        // when
        Menu menu = menuService.findByMenuNo(menuNo);
        //then
        assertThat(menu).isNull();
        System.out.println(menu);
    }
    
    // 메뉴 이름으로 식당 식별번호 조회 - 재준
    @DisplayName("메뉴이름으로 식당 조회")
    @Test
    void test3() {
        // given
        // 사용자가 메뉴명(ex: 떡볶이)을 검색
        String menuName = "떡볶이";

        // when
        List<String> restNos = menuService.findByMenuName(menuName);

        // then
        assertThat(restNos)
                .isNotNull()
                .allSatisfy((restNo) -> {
                    assertThat(restNo).isNotNull();
                    System.out.println(restNo);
                });
    }
}
