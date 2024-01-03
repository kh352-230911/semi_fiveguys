package com.sh.guys.attraction.controller;

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

    }
}