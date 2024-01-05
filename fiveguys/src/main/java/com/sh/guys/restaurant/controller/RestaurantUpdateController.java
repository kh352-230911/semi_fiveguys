package com.sh.guys.restaurant.controller;

import com.sh.guys.restaurant.model.entity.Reservation;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/restaurant/restaurantUpdate")
public class RestaurantUpdateController extends HttpServlet {
    private RestaurantService restaurantService = new RestaurantService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자입력값 처리
        String no = req.getParameter("no");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String content = req.getParameter("content");
        String phone = req.getParameter("phone");
        String category = req.getParameter("category");
        String openTime = req.getParameter("opentime");
        String closeTime = req.getParameter("closetime");
        String _reservPossible = req.getParameter("reservPossible");
        Reservation reservPossible = Reservation.valueOf(_reservPossible);

        Restaurant restaurant = new Restaurant();
        restaurant.setNo(no);
        restaurant.setName(name);
        restaurant.setAddress(address);
        restaurant.setContent(content);
        restaurant.setPhone(phone);
        restaurant.setCategory(category);
        restaurant.setOpenTime(openTime);
        restaurant.setCloseTime(closeTime);
        restaurant.setReservPossible(reservPossible);

        // 2. 업무로직
        int result = restaurantService.updateRestaurant(restaurant);

        // 3. redirect
        resp.sendRedirect(req.getContextPath() + "/oner/onerRestaurantList");
    }
}