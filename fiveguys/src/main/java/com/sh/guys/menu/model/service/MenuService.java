package com.sh.guys.menu.model.service;

import com.sh.guys.menu.model.dao.MenuDao;
import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.vo.MenuVo;
import com.sh.guys.user.model.entity.User;
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
    public List<Menu> findAll() {
        SqlSession session = getSqlSession();
        List<Menu> menu = menuDao.findAll(session);
        session.close();
        return menu;
    }

    // 메뉴 식별번호로 존재하는 메뉴 한개 조회 - 재준
    public Menu findByNo(String menuNo) {
        SqlSession session = getSqlSession();
        Menu menu = menuDao.findByNo(session, menuNo);
        session.close();
        return menu;
    }

    // 메뉴 이름으로 식당 식별번호 조회 - 재준
    public List<String> findByName(String menuName) {
        SqlSession session = getSqlSession();
        List<String> restNo = menuDao.findByName(session, menuName);
        session.close();
        return restNo;
    }

    // 전체 게시물 수 조회 - 정호
    public int getTotalCount(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = menuDao.getTotalCount(session, param);
        session.close();
        return totalCount;
    }

    // 페이지 별 게시물 조회 - 정호
    public List<MenuVo> findAllPage(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<MenuVo> menus = menuDao.findAllPage(session, param);
        session.close();
        return menus;
    }

    public int getTotalCount1() {
        SqlSession session = getSqlSession();
        int totalCount = menuDao.getTotalCount1(session);
        session.close();
        return totalCount;
    }

    public List<MenuVo> findUserPage(Map<String, Object> param1) {
        SqlSession session = getSqlSession();
        List<MenuVo> menus = menuDao.findUserPage(session, param1);
        session.close();
        return menus;
    }
}
