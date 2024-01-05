package com.sh.guys.oner.controller;

import com.sh.guys.oner.model.service.OnerService;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/oner/onerRestaurantList")
public class OnerRestaurantListController extends HttpServlet {

    private OnerService onerService = new OnerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력값 가져오기
        HttpSession session = req.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        String userNo = loginUser.getNo();
        System.out.println(userNo);

        // 2. 업무로직
        List<Restaurant> restaurant = onerService.findMyRestaurant(userNo);
        System.out.println(restaurant);
        req.setAttribute("restaurant", restaurant);

        // 3. view단 처리
        req.getRequestDispatcher("/WEB-INF/views/oner/onerRestaurantList.jsp").forward(req, resp);
    }
}
