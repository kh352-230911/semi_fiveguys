package com.sh.guys.user.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/userLogout")
public class UserLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // - false 세션이 있으면 세션반환, 없으면 null 반환
        HttpSession session = req.getSession(false); // 새로 생성여부

        if (session != null)
            session.invalidate();

        //인덱스페이지로 이동 (url변경)
        resp.sendRedirect(req.getContextPath() + "/");
    }
}