package com.sh.guys.admin.model.service;

import com.sh.guys.admin.model.dao.AdminDao;
import com.sh.guys.menu.model.vo.MenuVo;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class AdminService {
    private AdminDao adminDao = new AdminDao();

    // 전체 게시물 수 조회 - 재준
    public int getTotalCount(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = adminDao.getTotalCount(session);
        session.close();
        return totalCount;
    }

    // 페이지 별 게시물 조회 - 재준
    public List<User> findAllPage(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<User> users = adminDao.findAllPage(session, param);
        session.close();
        return users;
    }
}
