package com.sh.guys.restaurant.controller;

import com.sh.guys.attraction.model.entity.Attraction;
import com.sh.guys.attraction.model.service.AttractionService;
import com.sh.guys.convenience.model.vo.ConvenienceVo;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;
import com.sh.guys.restaurant.model.vo.RestaurantVo;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/restaurant/restaurantDetail")
public class restaurantDetailServlet extends HttpServlet {

    private RestaurantService restaurantService = new RestaurantService();
    private AttractionService attractionService = new AttractionService();

    // 식당 상세페이지 조회 - 우진
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자 처리
        String no = req.getParameter("no");
        System.out.println(no);

        // 조회
        RestaurantVo restaurantVo = restaurantService.findByNo(no);
        System.out.println(restaurantVo);
        req.setAttribute("restaurantVo", restaurantVo);

        // 편의시설 조회
        List<ConvenienceVo> convenienceVo = restaurantService.findConven(no);
        System.out.println(convenienceVo);
        req.setAttribute("convenienceVo", convenienceVo);

        // 좋아요 여부
        User loginUser = (User) req.getSession().getAttribute("loginUser");
        if(loginUser != null) {
            Map<String, Object> param = new HashMap<>();
            param.put("usersNo", loginUser.getNo());
            param.put("restNo", restaurantVo.getNo());
            List<Attraction> attractions = attractionService.findByUsersNoRestNo(param);

            if(attractions.size() > 0){
                req.setAttribute("attractions", attractions);
                System.out.println(attractions);
            }
        }

        // 응답
        req.getRequestDispatcher("/WEB-INF/views/restaurant/restaurantDetail.jsp")
                .forward(req, resp);
    }
}