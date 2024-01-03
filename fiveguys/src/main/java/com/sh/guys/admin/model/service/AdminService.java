package com.sh.guys.admin.model.service;

import com.mchange.io.impl.LazyReadOnlyMemoryFileImpl;
import com.sh.guys.admin.model.dao.AdminDao;
import com.sh.guys.admin.model.vo.UserVO;
import com.sh.guys.user.model.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class AdminService {
    private AdminDao adminDao = new AdminDao();

    public int getTotalCountRollUp(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        int totalCount = adminDao.getTotalCountRollUp(session);
        session.close();
        return totalCount;
    }

    // 페이지 별 게시물 조회 - 재준
    public List<UserVO> findAllPageRollUp(Map<String, Object> param) {
        SqlSession session = getSqlSession();
        List<UserVO> usersVO = adminDao.findAllPageRollUp(session, param);
        session.close();
        return usersVO;
    }
}
