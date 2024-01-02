package com.sh.guys.admin.model.dao;

import com.sh.guys.menu.model.vo.MenuVo;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public class AdminDao {

    // 전체 게시물 조회 - 재준
    public int getTotalCount(SqlSession session) {
        return session.selectOne("menu.getTotalCount");
    }

    // 페이지 별 게시물 조회 - 정호
    public List<User> findAllPage(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("menu.findAllPage", null, rowBounds);
    }
}
