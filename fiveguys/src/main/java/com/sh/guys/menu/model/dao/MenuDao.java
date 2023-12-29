package com.sh.guys.menu.model.dao;

import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.menu.model.vo.MenuVo;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class MenuDao {
    public int getTotalCount(SqlSession session) {
        return session.selectOne("menu.getTotalCount");
    }

    public List<MenuVo> findAll(SqlSession session, Map<String, Integer> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("menu.findAll", null, rowBounds);
    }
}
