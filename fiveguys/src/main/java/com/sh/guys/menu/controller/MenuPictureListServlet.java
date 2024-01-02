package com.sh.guys.menu.controller;

import com.sh.guys.menu.model.service.MenuService;
import com.sh.guys.notification.model.service.NotificatonService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("")
public class MenuPictureListServlet extends HttpServlet {
    private MenuService menuService = new MenuService();
    private NotificatonService notificatonService = new NotificatonService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력 값 처리
        // 2. 업무 로직
        int limit = 5;
        int totalCount = menuService.getTotalCount();
        int totalPage = (int) Math.ceil((double) totalCount / limit);
        req.setAttribute("totalPage", totalPage);

        // 3. view단 처리
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}