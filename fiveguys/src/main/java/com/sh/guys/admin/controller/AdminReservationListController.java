package com.sh.guys.admin.controller;

import com.sh.guys.common.FiveGuysUtils;
import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.reservation.model.service.ReservationService;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;
import com.sh.guys.restaurant.model.vo.RestaurantVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/adminReservationList")
public class AdminReservationListController extends HttpServlet {
    private RestaurantService restaurantService = new RestaurantService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int page = 1;
        int limit = 10;
        try {
            page = Integer.parseInt(req.getParameter("page"));
        } catch (NumberFormatException ignore) {}
        String searchType = req.getParameter("search-type");
        String searchKeyword = req.getParameter("search-keyword");

        Map<String, Object> param = new HashMap<>();
        param.put("searchType", searchType);
        param.put("searchKeyword", searchKeyword);
        param.put("page", page);
        param.put("limit", limit);
        System.out.println(param);

        List<RestaurantVo> restaurantVos = restaurantService.reservationFindAll(param);
        System.out.println(restaurantVos);
        req.setAttribute("restaurantVos", restaurantVos);

        int totalCount = restaurantService.getTotalCount(param);
        System.out.println(totalCount);
        String url = req.getRequestURI();
        if(searchType != null && searchKeyword != null) {
            url += "?search-type=" + searchType + "&search-keyword=" + searchKeyword;
        }
        String pagebar = FiveGuysUtils.getPagebar(page, limit, totalCount, url);
        req.setAttribute("pagebar", pagebar);

        req.getRequestDispatcher("/WEB-INF/views/admin/adminReservationList.jsp").forward(req, resp);
    }
}