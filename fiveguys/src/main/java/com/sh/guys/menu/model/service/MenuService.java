package com.sh.guys.menu.model.service;

import com.sh.guys.menu.model.dao.MenuDao;
import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.vo.MenuVo;
import org.apache.ibatis.session.SqlSession;
import java.util.List;
import java.util.Map;
import com.sh.guys.menu.model.entity.Menu;
import org.apache.ibatis.session.SqlSession;
import java.util.List;
import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class MenuService {
    private MenuDao menuDao = new MenuDao();

    // 메뉴 전체 조회 - 재준
    public List<Menu> findMenuAll() {
        SqlSession session = getSqlSession();
        List<Menu> menu = menuDao.findMenuAll(session);
        session.close();
        return menu;
    }

    // 메뉴 식별번호로 존재하는 메뉴 한개 조회 - 재준
    public Menu findByMenuNo(String menuNo) {
        SqlSession session = getSqlSession();
        Menu menu = menuDao.findByMenuNo(session, menuNo);
        session.close();
        return menu;
    }

    // 메뉴 이름으로 식당 식별번호 조회 - 재준
    public List<String> findByMenuName(String menuName) {
        SqlSession session = getSqlSession();
        List<String> restNo = menuDao.findByMenuName(session, menuName);
        session.close();
        return restNo;
    }

    // 전체 게시물 수 조회 - 정호
    public int getTotalCount() {
        SqlSession session = getSqlSession();
        int totalCount = menuDao.getTotalCount(session);
        session.close();
        return totalCount;
    }

    // 페이지 별 게시물 조회 - 정호
    public List<MenuVo> findAll(Map<String, Integer> param) {
        SqlSession session = getSqlSession();
        List<MenuVo> menus = menuDao.findAll(session, param);
        session.close();
        return menus;
    }
}
