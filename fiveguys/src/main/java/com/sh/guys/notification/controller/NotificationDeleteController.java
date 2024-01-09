package com.sh.guys.notification.controller;

import com.sh.guys.notification.model.service.NotificationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/notification/notificationDelete")
public class NotificationDeleteController extends HttpServlet {
    private NotificationService notificationService = new NotificationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String no = req.getParameter("no");
        System.out.println(no);

        int result = notificationService.deleteNoti(no);
        System.out.println(result);

        resp.sendRedirect(req.getContextPath() + "/");
    }
}