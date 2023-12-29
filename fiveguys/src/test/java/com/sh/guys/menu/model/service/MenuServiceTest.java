package com.sh.guys.menu.model.service;

import com.sh.guys.menu.model.entity.Menu;
import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.vo.MenuVo;
import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.MethodSource;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.IntStream;
import java.util.stream.Stream;
import org.junit.jupiter.params.provider.ValueSource;
import java.util.List;
import static org.assertj.core.api.Assertions.assertThat;

public class MenuServiceTest {
    private MenuService menuService;
    static final int LIMIT = 5;

    @BeforeEach
    @Test
    public void setUp() {
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
                    assertThat(menu.getNo()).isNotNull();
                    assertThat(menu.getRestNo()).isNotNull();
                    assertThat(menu.getName()).isNotNull();
                    assertThat(menu.getContent()).isNotNull();
                    assertThat(menu.getPrice()).isNotZero();
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
                    assertThat(_menu.getNo()).isNotNull();
                    assertThat(_menu.getRestNo()).isNotNull();
                    assertThat(_menu.getName()).isNotNull();
                    assertThat(_menu.getContent()).isNotNull();
                    assertThat(_menu.getPrice()).isNotZero();
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

    @DisplayName("전제 게시물 조회")
    @Test
    public void test4() {
        int totalCount = menuService.getTotalCount();
        assertThat(totalCount).isGreaterThanOrEqualTo(0);
    }

    @DisplayName("페이지 별 게시물 조회")
    @ParameterizedTest
    @MethodSource("pageProvider")
    public void test5(int page) {
        assertThat(page).isNotZero();

        Map<String, Integer> param = Map.of("page", page, "limit", LIMIT);
        List<MenuVo> menus = menuService.findAll(param);
        System.out.println(menus);

//        assertThat(menus)
//                .isNotNull()
//                .isNotEmpty()
//                .allSatisfy((menu) -> {
//                   assertThat(menu.getNo()).isNotNull();
//                   assertThat(menu.getRestNo()).isEqualTo(menu.getNo());
//                   assertThat(menu.get).isEqualTo(menu.getNo());
//                });

    }

    public static Stream<Integer> pageProvider() {
        MenuService menuService = new MenuService();
        int totalCount = menuService.getTotalCount();
        int totalPage = (int) Math.ceil((double) totalCount / LIMIT);
        return IntStream.rangeClosed(1, totalPage).boxed();
    }
}
