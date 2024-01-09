package com.sh.guys.attraction.controller;

import com.sh.guys.attraction.model.entity.Attraction;
import com.sh.guys.attraction.model.service.AttractionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/attraction/attractionInsert")
public class AttractionInsertServlet extends HttpServlet {
    private AttractionService attractionService = new AttractionService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자 입력값 처리
        String restNo = req.getParameter("restNo");
        String usersNo = req.getParameter("usersNo");
        System.out.println(restNo + " " + usersNo);

        // 2. 업무 로직
        Attraction attraction = new Attraction();
        attraction.setRestNo(restNo);
        attraction.setUsersNo(usersNo);
        System.out.println(attraction);

        int result = attractionService.insertAttraction(attraction);
        System.out.println(result);
    }
}