package com.sh.guys.reservation.controller;

import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.reservation.model.service.ReservationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reservation/reservationRegister")
public class ReservationRegisterServlet extends HttpServlet {
    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String restNo = req.getParameter("no");
        String usersNo = req.getParameter("usersNo");
        String name = req.getParameter("name");
        int people = Integer.parseInt(req.getParameter("people"));
        String request = req.getParameter("request");
        System.out.println(restNo + "     " + usersNo + "     " + name + "      " + people + "      " + request);

        Reservation reservation = new Reservation();
        reservation.setRestNo(restNo);
        reservation.setUsersNo(usersNo);
        reservation.setReservName(name);
        reservation.setReservPeople(people);
        reservation.setRequest(request);

        int result = reservationService.insertReservation(reservation);

        req.getSession().setAttribute("msg", "예약이 완료되었습니다.");

        resp.sendRedirect(req.getContextPath() + "/restaurant/restaurantDetail?no=" + restNo);
    }
}