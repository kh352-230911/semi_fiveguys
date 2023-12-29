package com.sh.guys.user.controller;

import com.sh.guys.user.model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/userRegister")
public class UserRegisterServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 인코딩처리
        req.setCharacterEncoding("utf-8");
        //2. 사용자입력값 가져오기
//        Number userNo = req.getParameter("userNo");
        //3. 업무로직
        //. 리다이렉트후 경고창 성공메세지 전달
        //4. view단 처리
    }
}