package com.sh.guys.admin.controller;

import com.sh.guys.admin.model.service.AdminService;
import com.sh.guys.admin.model.vo.UserVO;
import com.sh.guys.common.FiveGuysUtils;
import com.sh.guys.restaurant.model.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/adminRestaurantListController")
public class AdminRestaurantListController extends HttpServlet {
    private AdminService adminService = new AdminService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력값 가져오기
        int page = 1; // 기본값
        // 지정해 두어야 페이지 로드시 페이지 값이 없는 상태기에 생기는 오류를 무시한 상태에서 기본값으로 적용이 가능하다
        int limit = 10;
        try {
            page = Integer.parseInt(req.getParameter("page"));
        } catch (NumberFormatException ignore) {}

        String searchType = req.getParameter("search-type");
        String searchKeyword = req.getParameter("search-keyword");

        Map<String, Object> param = new HashMap<>();
        param.put("searchType", searchType);
        param.put("searchKeyword", searchKeyword);
        param.put("page", page);
        param.put("limit", limit);
        System.out.println(param);

        // 2. 업무로직
        // a. content 영역 : 전체조회 쿼리 + RowBounds | Top-n 분석 쿼리
        List<UserVO> usersVO = adminService.findAllPageRestaurantList(param);
        System.out.println(usersVO);
        req.setAttribute("usersVO", usersVO);

        // b. pagebar 영역
        int totalCount = adminService.getTotalCountRestaurantList(param); // 검색조건에 맞는 총 회원수
        String url = req.getRequestURI();
        if (searchType != null && searchKeyword != null) {
            url += "?search-type=" + searchType + "&search-keyword=" + searchKeyword;
        }
        String pagebar = FiveGuysUtils.getPagebar(page, limit, totalCount, url);
        req.setAttribute("pagebar", pagebar);

        // 3. view단 처리
        req.getRequestDispatcher("/WEB-INF/views/admin/adminRestaurantListController.jsp").forward(req, resp);
    }
}
