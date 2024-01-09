package com.sh.guys.menu.controller;

import com.sh.guys.menu.model.service.MenuService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/menu/menuDelete")
public class MenuDeleteController extends HttpServlet {
    private MenuService menuService = new MenuService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자입력값 처리
        String no = req.getParameter("no");
        System.out.println("no" + no);
        String restNo = req.getParameter("restNo");
        System.out.println("restNo" + restNo);

        // 2. 업무로직
        int result = menuService.deleteMenu(no);
        req.getSession().setAttribute("msg", "메뉴를 삭제했습니다. 😁");

        // 3. 리다이렉트
        resp.sendRedirect(req.getContextPath() + "/restaurant/restaurantDetail?no=" + restNo);
    }
}