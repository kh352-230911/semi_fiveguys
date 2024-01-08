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

    public int insertMenu(MenuVo menuVo) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            // Menu 테이블에 등록
            System.out.println(menuVo);
            result = menuDao.insertMenu(session, menuVo);
            System.out.println(result + "MenuService#insertMenu : Menu#No = " + menuVo.getNo());

            // MenuPicture 테이블에 등록
            List<MenuPicture> menuPictures = menuVo.getMenuPicture();
            if (!menuPictures.isEmpty()) {
                for (MenuPicture menuPicture : menuPictures) {
                    menuPicture.setMenuNo(menuVo.getNo());
                    System.out.println(menuPicture);
                    result = menuDao.insertMenuPicture(session, menuPicture);
                    System.out.println(result);
                }
            }
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public MenuVo findForUpdate(MenuVo menuVo) {
        SqlSession session = getSqlSession();
        MenuVo menu = menuDao.findForUpdate(session, menuVo);
        session.close();
        return menu;
    }

    public int updateMenu(MenuVo menuVo) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            // Menu 테이블 수정
            System.out.println(menuVo);
            result = menuDao.updateMenu(session, menuVo);

            // MenuPicture 테이블 수정
            List<MenuPicture> menuPictures = menuVo.getMenuPicture();
            if (!menuPictures.isEmpty()) {
                for (MenuPicture menuPicture : menuPictures) {
                    menuPicture.setMenuNo(menuVo.getNo());
                    System.out.println(menuPicture);
                    result = menuDao.insertMenuPicture(session, menuPicture);
                    System.out.println(result);
                }
            }
            
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int deleteMenu(String no) {
        int result = 0;
        SqlSession session = getSqlSession();
        try {
            result = menuDao.deleteMenu(session, no);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }
}
