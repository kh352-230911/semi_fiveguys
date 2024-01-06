package com.sh.guys.restaurant.controller;

import com.google.gson.Gson;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/restaurant/checkPhoneDuplicate")
public class CheckPhoneDuplicateController extends HttpServlet {
    private RestaurantService restaurantService = new RestaurantService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자입력값 처리
        String phone = req.getParameter("phone");
//        System.out.println(phone);

        // 2. 업무로직
        Restaurant restaurant = restaurantService.findByPhone(phone);
//        System.out.println(restaurant);
        boolean result = restaurant == null;

        // 3. 응답 json 작성
        resp.setContentType("application/json; charset=utf-8");
        Map<String, Object> map = Map.of("result", result);
        new Gson().toJson(map, resp.getWriter());
    }
}