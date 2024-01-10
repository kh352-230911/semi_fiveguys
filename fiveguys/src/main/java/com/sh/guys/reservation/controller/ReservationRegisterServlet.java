package com.sh.guys.reservation.controller;

import com.sh.guys.notification.model.service.NotificationService;
import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.reservation.model.service.ReservationService;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reservation/reservationRegister")
public class ReservationRegisterServlet extends HttpServlet {
    private ReservationService reservationService = new ReservationService();
    private NotificationService notificationService = new NotificationService();
    private UserService userService = new UserService();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String restNo = req.getParameter("restNo");
        String usersNo = req.getParameter("usersNo");
        String reservName = req.getParameter("name");
        int reservPeople = Integer.parseInt(req.getParameter("people"));
        String request = req.getParameter("request");
        String phone = req.getParameter("phone");
        System.out.println(restNo + "     " + usersNo + "     " + reservName + "      " + reservPeople + "      " + request);

        String reservDate = req.getParameter("reservDate");
        System.out.println(reservDate);
        String reservTime = req.getParameter("reservTime");
        System.out.println(reservTime);
//        System.out.println(restNo + "     " + usersNo + "     " + reservName + "      " + reservPeople + "      " + request);

        User user = userService.findByUsersNo(usersNo);
        String id = user.getId();
        System.out.println(id);

        Reservation reservation = new Reservation();
        reservation.setRestNo(restNo);
        reservation.setReservDate(reservDate);
        reservation.setReservTime(reservTime);
        System.out.println(reservation);

        // 예약 막기
        int count = reservationService.countReservation(reservation);
        System.out.println(count);

        int result = notificationService.reservation(id, restNo);

        req.getSession().setAttribute("msg", "예약이 완료되었습니다.");

        if (count < 5) {
            // 예약
            reservation.setUsersNo(usersNo);
            reservation.setReservName(reservName);
            reservation.setReservPeople(reservPeople);
            reservation.setRequest(request);
            reservation.setReservPhone(phone);
            System.out.println(reservation);

            result = reservationService.insertReservation(reservation);
            req.getSession().setAttribute("msg", "예약이 완료되었습니다.");
        } else {
            req.getSession().setAttribute("msg", "마감된 예약입니다, 죄송합니다.");
        }


        resp.sendRedirect(req.getContextPath() + "/restaurant/restaurantDetail?no=" + restNo);
    }
}