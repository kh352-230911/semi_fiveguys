package com.sh.guys.review.controller;

import com.sh.guys.common.HelloMvcUtils;
import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.service.ReviewService;
import com.sh.guys.review.vo.ReviewVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/review/reviewList")
public class ReviewListServlet extends HttpServlet {
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


            String restNo = req.getParameter("no");
            System.out.println(restNo);

            // restNo로 조회
            List<Review> reviews = reviewService.findByRestNo(restNo);
            System.out.println(reviews);
            req.setAttribute("reviews", reviews);




        req.getRequestDispatcher("/WEB-INF/views/review/reviewList.jsp")
                    .forward(req, resp);

        }
    }
