package com.sh.guys.admin.controller;

import com.sh.guys.reservation.model.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/reservationCancel")
public class AdminReservationCancelController extends HttpServlet {
    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String reservNo = req.getParameter("reservNo");
        System.out.println(reservNo);

        int result = reservationService.cancelReservation(reservNo);
        System.out.println(result);

        req.getSession().setAttribute("msg", "예약이 취소되었습니다. ");

        resp.sendRedirect(req.getContextPath() + "/admin/adminReservationList");
    }
}