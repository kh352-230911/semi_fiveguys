package com.sh.guys.menu.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.guys.common.GsonConverter;
import com.sh.guys.menu.model.service.MenuService;
import com.sh.guys.menu.model.vo.MenuVo;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/picture/page")
public class MenuPicturePageServlet extends HttpServlet {
    private MenuService menuService = new MenuService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력 값 처리
        // 로그인 되었을때 유저의 기본키 가져오기
        HttpSession session = req.getSession();
        User no = (User) session.getAttribute("loginUser");
        String no1 = null;

        if (no != null) {
            no1 = no.getNo();
            System.out.println(no1);
        }

        int page = Integer.parseInt(req.getParameter("page"));
        final int limit = 5;
        String searchType = req.getParameter("searchType");
        String searchKeyword = req.getParameter("searchKeyword");

        Map<String, Object> param = new HashMap<>();
        param.put("searchType", searchType);
        param.put("searchKeyword", searchKeyword);
        param.put("page", page);
        param.put("limit", limit);
        if (no1 != null) {
            param.put("no1", no1);
        }
        System.out.println(param);

        // 2. 업무 로직
        List<MenuVo> menus = null;
        menus = menuService.findAllPage(param);
        System.out.println(menus);




        // 3. json 응답처리
        resp.setContentType("application/json; charset=utf-8");

        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.registerTypeAdapter(LocalDate.class, GsonConverter.LOCAL_DATE_SERIALIZER);
        gsonBuilder.registerTypeAdapter(LocalDate.class, GsonConverter.LOCAL_DATE_DESERIALIZER);
        gsonBuilder.registerTypeAdapter(LocalDateTime.class, GsonConverter.LOCAL_DATE_TIME_SERIALIZER);
        gsonBuilder.registerTypeAdapter(LocalDateTime.class, GsonConverter.LOCAL_DATE_TIME_DESERIALIZER);
        Gson gson = gsonBuilder.create();

        if(page != 1) {
            gson.toJson(Map.of("menus", menus), resp.getWriter());
        }
        else {
            int totalCount = menuService.getTotalCount(param);
            int totalPage = (int) Math.ceil((double) totalCount / limit);
            gson.toJson(Map.of("menus", menus, "totalPage", totalPage), resp.getWriter());
        }
    }
}