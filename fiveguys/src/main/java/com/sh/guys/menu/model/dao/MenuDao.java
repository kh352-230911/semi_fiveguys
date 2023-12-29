package com.sh.guys.menu.model.dao;

import com.sh.guys.menu.model.entity.Menu;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class MenuDao {

    // 메뉴 전체 조회 - 재준
    public List<Menu> findMenuAll(SqlSession session) {
        return session.selectList("menu.findMenuAll");
    }

    // 메뉴 식별번호로 메뉴 한개 조회 - 재준
    public Menu findByMenuNo(SqlSession session, String menuNo) {
        return session.selectOne("menu.findByMenuNo", menuNo);
    }

    // 메뉴 추가 - 재준
    public int insertMenu(SqlSession session, Menu menu) {
        return session.insert("menu.insertMenu", menu);
    }

    // 메뉴 수정 - 재준
    public int updateMenu(SqlSession session, Menu menu) {
        return session.update("menu.updateMenu", menu);
    }

    // 메뉴 삭제 - 재준
    public int deleteMenu(SqlSession session, String menuNo) {
        return session.delete("menu.deleteMenu", menuNo);
    }

    // 메뉴 이름으로 식당 식별번호 조회 - 재준
    public List<String> findByMenuName(SqlSession session, String menuName) {
        return session.selectList("menu.findByMenuName", menuName);
    }
}
