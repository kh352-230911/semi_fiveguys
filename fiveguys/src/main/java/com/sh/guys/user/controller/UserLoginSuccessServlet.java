package com.sh.guys.user.controller;

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

@WebServlet("/user/loginSuccess")
public class UserLoginSuccessServlet extends HttpServlet {
    private NotificationService notificationService = new NotificationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("로그인 성공 후 처리...");

        User loginUser = (User) req.getSession().getAttribute("loginUser");
        if(loginUser != null) {
            List<Notification> notifications = notificationService.findByUserId(loginUser.getId());
            System.out.println(notifications);
            req.getSession().setAttribute("notifications", notifications);
        }

        String location = req.getContextPath() + "/";
        String next = (String) req.getSession().getAttribute("next");
        if (next != null) {
            location = next;
            req.getSession().removeAttribute("next");
        }
        resp.sendRedirect(location);
    }
}