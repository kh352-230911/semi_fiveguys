package com.sh.guys.review.controller;

import com.sh.guys.review.model.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/review/reviewDelete")
public class ReviewDeleteServlet extends HttpServlet {

    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reviewNo = req.getParameter("reviewNo");
        System.out.println(reviewNo);

        int result = reviewService.reviewDelete(reviewNo);
        System.out.println(result);

        req.getSession().setAttribute("msg", "리뷰가 삭제되었습니다. ");
        resp.sendRedirect(req.getContextPath() + "/user/userDetail");
    }
}