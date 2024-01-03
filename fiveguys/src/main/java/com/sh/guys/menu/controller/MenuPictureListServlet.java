package com.sh.guys.menu.controller;

import com.sh.guys.menu.model.service.MenuService;
import com.sh.guys.menu.model.vo.MenuVo;
import com.sh.guys.notification.model.entity.Notification;
import com.sh.guys.notification.model.service.NotificatonService;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("")
public class MenuPictureListServlet extends HttpServlet {
    private MenuService menuService = new MenuService();
    private NotificatonService notificatonService = new NotificatonService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력 값 처리
        // 2. 업무 로직
//        int page = 1;
//        int limit = 5;
//        try{
//            page = Integer.parseInt(req.getParameter("page"));
//        } catch (NumberFormatException ignore){}
//
//        Map<String, Object> param = new HashMap<>();
//        param.put("page", page);
//        param.put("limit", limit);
//
//        int totalCount = menuService.getTotalCount(param);
//        int totalPage = (int) Math.ceil((double) totalCount / limit);
//        System.out.println(totalPage);
//        req.setAttribute("totalPage", totalPage);

        User loginUser = (User) req.getSession().getAttribute("loginUser");
        System.out.println(loginUser);
        if(loginUser != null) {
            List<Notification> notifications = notificatonService.findByUserId(loginUser.getId());
            req.setAttribute("notifications", notifications);
        }

        // 3. view단 처리
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}