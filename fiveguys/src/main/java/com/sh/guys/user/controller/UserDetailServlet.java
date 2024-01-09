package com.sh.guys.user.controller;

import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.service.UserService;
import com.sh.guys.user.model.vo.UserAttractionVo;
import com.sh.guys.user.model.vo.UserReservationVo;
import com.sh.guys.user.model.vo.UserReviewVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


@WebServlet("/user/userDetail")
public class UserDetailServlet extends HttpServlet {

    UserService userService = new UserService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession httpSession = req.getSession();
        // 1. 사용자 입력값 - 우진
        User no = (User) httpSession.getAttribute("loginUser");
        String no1 = no.getNo();
        System.out.println(no1);

        // 2. 유저가 누른 좋아요 조회 - 우진
        List<UserAttractionVo> userAttractionVo = userService.findByNo(no1);
        System.out.println(userAttractionVo);
        req.setAttribute("userAttractionVo", userAttractionVo);

        // 유저가 예약한 식당 목록 조회
        List<UserReservationVo> userReservationVo = userService.findReservation(no1);
        System.out.println(userReservationVo);
        req.setAttribute("userReservationVo", userReservationVo);

        // 유저가 작성한 리뷰 목록 조회
        List<UserReviewVo> userReviewVo = userService.findMyReview(no1);
        System.out.println(userReviewVo);
        req.setAttribute("userReviewVo", userReviewVo);

        req.getRequestDispatcher("/WEB-INF/views/user/userDetail.jsp")
                .forward(req, resp);
    }
}