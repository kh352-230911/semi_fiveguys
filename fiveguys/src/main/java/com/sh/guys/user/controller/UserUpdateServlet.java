package com.sh.guys.user.controller;

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


@WebServlet("/user/userUpdate")
public class UserUpdateServlet extends HttpServlet {
    private UserService userService = new UserService();
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 2. 사용자입력값 가져오기
        User loginUser = (User) req.getSession().getAttribute("loginUser");
        String id = loginUser.getId();
        String name = req.getParameter("name");
        String nickName =req.getParameter("nickName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String _gender = req.getParameter("gender");
        String[] _category = req.getParameterValues("category");


        Gender gender = _gender != null ?
                Gender.valueOf(_gender) :
                null;

        List<String> category = _category != null ?
                Arrays.asList(_category) : null;

        User user = new User(null, id, null, name, nickName, gender,email,phone,
                Role.U, category, null );
        System.out.println(user);

        // 3. 업무로직
        int result = userService.updateUser(user);
        // db정보가 성공적으로 수정되었다면, 해당내용으로 session속성 loginMember업데이트
        User userUpdated = userService.findById(id);
        req.getSession().setAttribute("loginUser", userUpdated);


        resp.sendRedirect(req.getContextPath() + "/user/userDetail");

    }
}