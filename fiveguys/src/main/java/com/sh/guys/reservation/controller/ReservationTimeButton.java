package com.sh.guys.reservation.controller;

import com.google.gson.Gson;
import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.reservation.model.service.ReservationService;
import com.sh.guys.reservation.model.vo.ReservationVO;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;
import com.sh.guys.restaurant.model.vo.RestaurantVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet("/reservation/reservationTimeButton")
public class ReservationTimeButton extends HttpServlet {
    private RestaurantService restaurantService = new RestaurantService();
    private ReservationService reservationService = new ReservationService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. 사용자입력값 처리
        String no = req.getParameter("no");
        System.out.println(no);

        RestaurantVo restaurantVo = restaurantService.findByNo(no);
        System.out.println(restaurantVo);

        // 예약 밑밥 만들기
        ReservationVO reservationVO = new ReservationVO();
        String restNo = req.getParameter("restNo");
        System.out.println("restNo : " + restNo);

        reservationVO.setRestNo(restNo);

        int count = reservationService.countReservation(reservationVO);
        reservationVO.setCount(count);
//        ReservationVO

        // 2. 업무 로직
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");

            // 비교할 시간 (문자열)
            String _openTime = restaurantVo.getOpenTime();
            System.out.println("_openTime = " + _openTime);
            String _closeTime = restaurantVo.getCloseTime();
            System.out.println("_closetime = " + _closeTime);
            String _correctionTime = "12:00";

            reservationVO.setOpenTime(_openTime);

            // 문자열 -> Date
            Date openTime = formatter.parse(_openTime);
//            System.out.println("openTime = " + openTime);
            Date closeTime = formatter.parse(_closeTime);
//            System.out.println("closeTime = " + closeTime);
            Date correctionTime = formatter.parse(_correctionTime);

            // Dage -> 밀리세컨즈
            long openMil = openTime.getTime();
            long closeMil = closeTime.getTime();
            long correctionMil = correctionTime.getTime();

            // 비교
            if (closeMil >= openMil) {
                long diff1 = closeMil - openMil;

                // for문 i값 만들기
                long _diffCount = diff1 / (1000 * 60 * 60);
//                System.out.println("_diffCount = " + _diffCount);
                String diffCount = String.valueOf(_diffCount);
//                System.out.println("diffCount = " + diffCount);

                reservationVO.setDiffCount(diffCount);
//                System.out.println("Y = " + reservationVO);
                req.setAttribute("reservationVO", reservationVO);

                // 3. 응답 json 작성
                resp.setContentType("application/json; charset=utf-8");
                Map<String, Object> map = Map.of("reservationVO", reservationVO);
                new Gson().toJson(map, resp.getWriter());
            } else {
                long diff2 = (closeMil + correctionMil) - openMil;
                // for문 i값 만들기
                long _diffCount = diff2 / (1000 * 60 * 60);
//                System.out.println("_diffCount = " + _diffCount);
                String diffCount = String.valueOf(_diffCount);
//                System.out.println("diffCount = " + diffCount);

                reservationVO.setDiffCount(diffCount);
//                System.out.println("N = " + reservationVO);
                req.setAttribute("reservationVO", reservationVO);

                // 3. 응답 json 작성
                resp.setContentType("application/json; charset=utf-8");
                Map<String, Object> map = Map.of("reservationVO", reservationVO);
                new Gson().toJson(map, resp.getWriter());
            }
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
}
