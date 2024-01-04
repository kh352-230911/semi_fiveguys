package com.sh.guys.user.controller;

import com.sh.guys.common.FiveGuysUtils;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {
    private  static  final long serialVersionUID = 1L;

    private UserService userService = new UserService();

//    비밀번호 변경페이지 제공
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/user/updatePassword.jsp")
                .forward(req, resp);

    }

//    비밀번호 처리
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        String id = loginUser.getId();

        String location = req.getContextPath();
        String msg = null;

        //1. 사용자 입력값 처리 :기본비밀번호/신규비밀번호 암호화처리 필수
        String oldPassword = FiveGuysUtils.getEncryptedPassword(req.getParameter("oldPassword"), id);
        String newPassword = FiveGuysUtils.getEncryptedPassword(req.getParameter("newPassword"), id);

        //2. 기존비밀번호 비교 : session의 loginUser객체 이용
        if (oldPassword.equals(loginUser.getPassword())) {

            //3. 업무로직 : 기존비밀번호가 일치한 경우만 신규비밀번호로 업데이트한다.
            loginUser.setPassword(newPassword); // 세션 갱신;
            int result = userService.updateUserPassword(loginUser);
            msg = "비빌번호를 변경했습니다";
            location += "/user/userDetail";
        }
        else {
            msg = "비밀번호가 일치하지 않습니다";
            location += "/user/updatePassword";
        }

        //4 사용자경고창 및 리다이렉트 처리
        session.setAttribute("msg", msg);
        resp.sendRedirect(location);

    }
}

