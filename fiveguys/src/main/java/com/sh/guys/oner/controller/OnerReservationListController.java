package com.sh.guys.oner.controller;

import com.sh.guys.oner.model.service.OnerService;
import com.sh.guys.oner.model.vo.OwnerReservationVo;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/oner/onerReservationList")
public class OnerReservationListController extends HttpServlet {

    private OnerService onerService = new OnerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // github
        HttpSession httpSession = req.getSession();
        // 1. 사용자 입력값 - 우진
        User no = (User) httpSession.getAttribute("loginUser");
        String no1 = no.getNo();
        System.out.println(no1);

        // 조회
        List<OwnerReservationVo> ownerReservationVo = onerService.findOwnerRestaurant(no1);
        System.out.println(ownerReservationVo);
        req.setAttribute("ownerReservationVo", ownerReservationVo);

        // view단 처리
        // end
        req.getRequestDispatcher("/WEB-INF/views/oner/onerReservationList.jsp").forward(req, resp);
    }
}