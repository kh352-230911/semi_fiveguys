package com.sh.guys.user.controller;

import com.sh.guys.common.FiveGuysUtils;
import com.sh.guys.user.model.entity.Gender;
import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;


@WebServlet("/user/userRegister")
public class UserRegisterServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/user/userRegister.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 인코딩처리
        req.setCharacterEncoding("utf-8");
        //2. 사용자입력값 가져오기
        String id = req.getParameter("id");
        String password = FiveGuysUtils.getEncryptedPassword(req.getParameter("password"),id);
        String name = req.getParameter("name");
        String nickName = req.getParameter("nickName");
        String _gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String[] _category = req.getParameterValues("category");
        System.out.println(id + ", " + password + ", " + name + ", " +nickName + ", " + _gender  + ", " + email + ", " + phone + ", " +_category + ", ");

        Gender gender = _gender != null ? Gender.valueOf(_gender) : null;
        List<String> category = _category != null ? Arrays.asList(_category) : null;
        System.out.println(id + ", " + password + ", " + name + ", " + nickName + ", " + gender  + ", " + email + ", " + phone + ", " +category);


        User user = new User(null, id, password, name, nickName, gender,email,phone,
                Role.U, category, null );

        System.out.println(user);


        //3. 업무로직
        int result = userService.insertUser(user);

        //. 리다이렉트후 경고창 성공메세지 전달
        req.getSession().setAttribute("msg", " 회원가입 축하드립니다. ");

        //4. view단 처리
        resp.sendRedirect(req.getContextPath() + "/");

    }
}