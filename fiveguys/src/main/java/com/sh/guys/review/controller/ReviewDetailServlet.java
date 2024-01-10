package com.sh.guys.review.controller;

import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.service.ReviewService;
import com.sh.guys.review.vo.ReviewVo;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/review/reviewDetail")
public class ReviewDetailServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reviewNo = req.getParameter("no");

        User user = (User) req.getSession().getAttribute("loginUser");
        System.out.println(user);

        ReviewVo reviewVo = reviewService.findByNo(reviewNo);
        System.out.println(reviewVo);
        req.setAttribute("reviewVo", reviewVo);

        req.getRequestDispatcher("/WEB-INF/views/review/reviewDetail.jsp").forward(req, resp);

    }


}