package com.sh.guys.user.controller;

import com.sh.guys.common.HelloMvcUtils;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/userLogin")
public class UserLoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Referer(사용자가 머물었던 페이지)를 세션에 저장
        String referer = req.getHeader("Referer");


        if (!referer.contains("/user/userLogin"))
            req.getSession().setAttribute("next", referer);

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/WEB-INF/views/user/userLogin.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //1. 사용자입력값 가져오기
        String id = req.getParameter("id");
        String password = HelloMvcUtils.getEncryptedPassword(req.getParameter("password"), id);

        User user = userService.findById(id);
        System.out.println(id + " " + password);

        //세셔생성/ 가져오기
        HttpSession session = req.getSession();
        if (user != null && password.equals(user.getPassword())) {
            // 로그인 성공
            // pageContext, request, session, application 컨텍스트객체중에 login처리에 적합한 것은 session
            // session객체는 사용자가 서버첫접속부터 세션해제시까지 유효
            session.setAttribute("loginUser", user);
            String location = req.getContextPath() + "/";
            String next = (String) req.getSession().getAttribute("next");
            if (next != null) {
                location = next;
                req.getSession().removeAttribute("next");
            }
            resp.sendRedirect(location);
        }
        else {
            session.setAttribute("msg", "아이디가 존재하지 않거나, 비밀번호가 틀립니다");
            resp.sendRedirect(req.getContextPath() + "/user/userLogin");
        }
    }
}