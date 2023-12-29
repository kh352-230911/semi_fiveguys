package com.sh.guys.menu.model.service;

import com.sh.guys.menu.model.entity.Menu;
import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.vo.MenuVo;
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

import static org.assertj.core.api.Assertions.assertThat;

public class MenuServiceTest {
    private MenuService menuService;
    static final int LIMIT = 5;

    @BeforeEach
    @Test
    public void setUp() {
        this.menuService = new MenuService();
    }

    @DisplayName("전제 게시물 조회")
    @Test
    public void test1() {
        int totalCount = menuService.getTotalCount();
        assertThat(totalCount).isGreaterThanOrEqualTo(0);
    }

    @DisplayName("페이지 별 게시물 조회")
    @ParameterizedTest
    @MethodSource("pageProvider")
    public void test2(int page) {
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
