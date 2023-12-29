package com.sh.guys.menu.model.service;

import com.sh.guys.menu.model.dao.MenuDao;
import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.vo.MenuVo;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class MenuService {
    private MenuDao menuDao = new MenuDao();

    public int getTotalCount() {
        SqlSession session = getSqlSession();
        int totalCount = menuDao.getTotalCount(session);
        session.close();
        return totalCount;
    }

    public List<MenuVo> findAll(Map<String, Integer> param) {
        SqlSession session = getSqlSession();
        List<MenuVo> menus = menuDao.findAll(session, param);
        session.close();
        return menus;
    }
}
