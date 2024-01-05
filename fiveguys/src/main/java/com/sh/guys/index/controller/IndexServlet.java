package com.sh.guys.index.controller;

import com.sh.guys.notification.model.entity.Notification;
import com.sh.guys.notification.model.service.NotificationService;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("")
public class IndexServlet extends HttpServlet {
    private NotificationService notificationService = new NotificationService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력 값 처리
        // 2. 업무 로직
        User loginUser = (User) req.getSession().getAttribute("loginUser");
        System.out.println(loginUser);
        if(loginUser != null) {
            List<Notification> notifications = notificationService.findByUserId(loginUser.getId());
            req.setAttribute("notifications", notifications);
        }

        // 3. view단 처리
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}