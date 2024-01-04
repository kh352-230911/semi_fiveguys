package com.sh.guys.attraction.controller;

import com.sh.guys.attraction.model.entity.Attraction;
import com.sh.guys.attraction.model.service.AttractionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/attraction/attractionDelete")
public class AttractionDeleteServlet extends HttpServlet {
    private AttractionService attractionService = new AttractionService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력 값 처리
        String usersNo = req.getParameter("usersNo");
        String restNo = req.getParameter("restNo");
        System.out.println(restNo + " " + usersNo);

        // 2. 업무 로직
        Attraction attraction = new Attraction();
        attraction.setUsersNo(usersNo);
        attraction.setRestNo(restNo);

        int result = attractionService.deleteAttraction(attraction);
        System.out.println(result);

    }
}