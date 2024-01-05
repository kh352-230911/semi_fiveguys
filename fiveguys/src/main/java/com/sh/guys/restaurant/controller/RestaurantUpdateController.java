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
        String no = req.getParameter("no");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String content = req.getParameter("content");
        String phone = req.getParameter("phone");
        String category = req.getParameter("category");
        String opentime = req.getParameter("opentime");
        String closetime = req.getParameter("closetime");
        String _reservPossible = req.getParameter("reservPossible");
        Reservation reservPossible = Reservation.valueOf(_reservPossible);

        Restaurant restaurant = new Restaurant();
        restaurant.setNo(no);
        restaurant.setName(name);
        restaurant.setAddress(address);
        restaurant.setContent(content);
        restaurant.setPhone(phone);
        restaurant.setCategory(category);
        restaurant.setOpenTime(opentime);
        restaurant.setCloseTime(closetime);
        restaurant.setReservPossible(reservPossible);


    }
}