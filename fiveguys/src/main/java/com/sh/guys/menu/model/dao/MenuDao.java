package com.sh.guys.menu.model.dao;

import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.vo.MenuVo;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import com.sh.guys.menu.model.entity.Menu;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MenuDao {

    // 메뉴 전체 조회 - 재준
    public List<Menu> findAll(SqlSession session) {
        return session.selectList("menu.findAll");
    }

    // 메뉴 식별번호로 메뉴 한개 조회 - 재준
    public Menu findByNo(SqlSession session, String menuNo) {
        return session.selectOne("menu.findByNo", menuNo);
    }

    // 메뉴 추가 - 재준
    public int insertMenu(SqlSession session, MenuVo menuVo) {
        return session.insert("menu.insertMenu", menuVo);
    }
    // 메뉴 사진 추가 - 재준
    public int insertMenuPicture(SqlSession session, MenuPicture menuPicture) {
        return session.insert("menu.insertMenuPicture", menuPicture);
    }

    // 메뉴 수정 - 재준
    public int updateMenu(SqlSession session, Menu menu) {
        return session.update("menu.updateMenu", menu);
    }
    public int updateMenuPicture(SqlSession session, MenuPicture menuPicture) {
        return session.update("menu.updateMenuPicture", menuPicture);
    }

    // 메뉴 삭제 - 재준
    public int deleteMenu(SqlSession session, String menuNo) {
        return session.delete("menu.deleteMenu", menuNo);
    }

    // 메뉴 이름으로 식당 식별번호 조회 - 재준
    public List<String> findByName(SqlSession session, String menuName) {
        return session.selectList("menu.findByName", menuName);
    }

    // 전체 게시물 조회 - 정호
    public int getTotalCount(SqlSession session, Map<String, Object> param) {
        return session.selectOne("menu.getTotalCount", param);
    }

    // 페이지 별 게시물 조회 - 정호
    public List<MenuVo> findAllPage(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("menu.findAllPage", param, rowBounds);
    }

    public int getTotalCount1(SqlSession session) {
        return session.selectOne("menu.getTotalCount");
    }

    public MenuVo findForUpdate(SqlSession session, MenuVo menuVo) {
        return session.selectOne("menu.findForUpdate", menuVo);
    }
}
