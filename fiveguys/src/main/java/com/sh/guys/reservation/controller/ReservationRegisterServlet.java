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
        String restNo = req.getParameter("restNo");
        String usersNo = req.getParameter("usersNo");
        String reservName = req.getParameter("name");
        int reservPeople = Integer.parseInt(req.getParameter("people"));
        String request = req.getParameter("request");
        String reservDate = req.getParameter("reservDate");
        System.out.println(reservDate);
        String reservTime = req.getParameter("reservTime");
        System.out.println(reservTime);
        System.out.println(restNo + "     " + usersNo + "     " + reservName + "      " + reservPeople + "      " + request);

        Reservation reservation = new Reservation();
        reservation.setRestNo(restNo);
        reservation.setUsersNo(usersNo);
        reservation.setReservName(reservName);
        reservation.setReservPeople(reservPeople);
        reservation.setRequest(request);
//        reservation.setReservDate(reservDate);
//        reservation.setReservTime(reservTime);

        int result = reservationService.insertReservation(reservation);

        req.getSession().setAttribute("msg", "예약이 완료되었습니다.");

        resp.sendRedirect(req.getContextPath() + "/restaurant/restaurantDetail?no=" + restNo);
    }
}