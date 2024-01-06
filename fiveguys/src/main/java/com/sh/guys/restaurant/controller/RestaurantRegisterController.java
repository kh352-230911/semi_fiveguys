package com.sh.guys.restaurant.controller;

import com.sh.guys.notification.model.service.NotificationService;
import com.sh.guys.restaurant.model.entity.Reservations;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/restaurant/restaurantRegister")
public class RestaurantRegisterController extends HttpServlet {

    private RestaurantService restaurantService = new RestaurantService();
    private NotificationService notificationService = new NotificationService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Referer(사용자가 머물었던 페이지)를 session에 저장
        String referer = req.getHeader("Referer");

        if (!referer.contains("restaurant/restaurantRegister")) {
            req.getSession().setAttribute("next", referer);
        }

        req.getRequestDispatcher("/WEB-INF/views/restaurant/restaurantRegister.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 인코딩처리
        // encodingFilter 클래스로 인해 생략

        // 2. 사용자 입력값 가져오기
        String no = req.getParameter("usersNo");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String content = req.getParameter("content");
        String phone = req.getParameter("phone");
        String category = req.getParameter("category");
        String openTime = req.getParameter("opentime");
        String closeTime = req.getParameter("closetime");
        String _reservPossible = req.getParameter("reservPossible");
        Reservations reservPossible = Reservations.valueOf(_reservPossible);

        Restaurant restaurant = new Restaurant();
        restaurant.setUsersNo(no);
        restaurant.setName(name);
        restaurant.setAddress(address);
        restaurant.setContent(content);
        restaurant.setPhone(phone);
        restaurant.setCategory(category);
        restaurant.setOpenTime(openTime);
        restaurant.setCloseTime(closeTime);
        restaurant.setReservPossible(reservPossible);
        System.out.println(restaurant);

        // 3. 업무로직
        int result = restaurantService.insertRestaurant(restaurant);

        //. 리다이렉트후 경고창 성공메세지 전달
        req.getSession().setAttribute("msg", "식당 등록이 완료되었습니다.");

        result = notificationService.recognize(id);
        // 4. redirect
        String location = (String) req.getSession().getAttribute("next");
        req.getSession().removeAttribute("next");
        resp.sendRedirect(location);
    }
}