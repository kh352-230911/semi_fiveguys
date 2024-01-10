package com.sh.guys.review.controller;

import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.service.ReviewService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/review/reviewUpdate")
public class ReviewUpdateServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String reviewNo = req.getParameter("no");

        Review review = reviewService.findByNo(reviewNo);
        req.setAttribute("review", review);
        System.out.println(reviewNo);
        req.getRequestDispatcher("/WEB-INF/views/review/reviewUpdate.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String content = req.getParameter("content");
        String reviewNo = req.getParameter("no");
        String usersNo = req.getParameter("usersNo");
        String restNo = req.getParameter("restNo");
        double revScore = Double.parseDouble(req.getParameter("revScore"));

        System.out.println(content + "   " + reviewNo + "    " + usersNo + "     " + restNo + " " + revScore);
        Review review = new Review();
        review.setContent(content);
        review.setRestNo(restNo);
        review.setNo(reviewNo);
        review.setUsersNo(usersNo);
        review.setStarGrade(revScore);

        int result = reviewService.updateReview(review);
        System.out.println(result);
        System.out.println(review);

        req.getSession().setAttribute("msg", "리뷰 수정이 성공적으로 완료되었습니다.");

        resp.sendRedirect(req.getContextPath() + "/review/reviewList?no=" + restNo);

    }
}