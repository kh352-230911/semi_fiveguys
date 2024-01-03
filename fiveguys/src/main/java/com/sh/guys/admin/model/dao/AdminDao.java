package com.sh.guys.admin.model.dao;

import com.sh.guys.admin.model.vo.UserVO;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class AdminDao {
    // 전체 게시물 조회 - 재준
    public int getTotalCountRollUp(SqlSession session) {
        return session.selectOne("admin.getTotalCountRollUp");
    }

    // 페이지 별 게시물 조회 - 재준
    public List<UserVO> findAllPageRollUp(SqlSession session, Map<String, Object> param) {
        int page = (int) param.get("page");
        int limit = (int) param.get("limit");
        int offset = (page - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return session.selectList("admin.findAllPageRollUp", param, rowBounds);
    }
}
