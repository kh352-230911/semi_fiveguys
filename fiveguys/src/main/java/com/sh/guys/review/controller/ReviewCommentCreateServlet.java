package com.sh.guys.review.controller;

import com.sh.guys.review.model.entity.ReviewComment;
import com.sh.guys.review.model.service.ReviewService;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/review/reviewCommentCreate")
public class ReviewCommentCreateServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 사용자입력값 처리
        HttpSession session = req.getSession();
        User no1 = (User) session.getAttribute("loginUser");
        String usersNo = no1.getNo();

        String no = req.getParameter("no");
//        String usersNo = req.getParameter("usersNo");
        String reviewNo = req.getParameter("reviewNo");
        String content = req.getParameter("content");
        System.out.println(no + "   " + usersNo + "    " + reviewNo +" " +content);
        int commentLevel = Integer.parseInt(req.getParameter("commentLevel"));
        Long parentCommentNo = null;
        try {
            parentCommentNo = Long.parseLong(req.getParameter("parentCommentNo"));
        } catch (NumberFormatException ignore) {}

        ReviewComment comment = new ReviewComment();
       comment.setNo(no);
//       comment.setUsersNo(usersNo);
       comment.setUsersNo(String.valueOf(usersNo));
       comment.setReviewNo(reviewNo);
       comment.setContent(content);
       comment.setCommentLevel(commentLevel);
       comment.setParentCommentNo(parentCommentNo);
        System.out.println(comment);

        //2.업무로직
        int result = reviewService.insertReviewComment(comment);
        req.getSession().setAttribute("msg", "답글을 정상들록했습니다");

        //3. redirect
        resp.sendRedirect(req.getContextPath() + "/review/reviewDetail?no=" + reviewNo);



    }
}