package com.sh.guys.restaurant.controller;

import com.sh.guys.attraction.model.entity.Attraction;
import com.sh.guys.attraction.model.service.AttractionService;
import com.sh.guys.convenience.model.vo.ConvenienceVo;
import com.sh.guys.reservation.model.vo.ReservationVO;
import com.sh.guys.restaurant.model.service.RestaurantService;
import com.sh.guys.restaurant.model.vo.RestaurantVo;
import com.sh.guys.restaurant.model.vo.StarAverageVo;
import com.sh.guys.user.model.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/restaurant/restaurantDetail")
public class RestaurantDetailServlet extends HttpServlet {

    private RestaurantService restaurantService = new RestaurantService();
    private AttractionService attractionService = new AttractionService();

    // 식당 상세페이지 조회 - 우진
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자 처리
        String no = req.getParameter("no");
        System.out.println(no);

        // 조회
        RestaurantVo restaurantVo = restaurantService.findByNo(no);
        System.out.println(restaurantVo);
        req.setAttribute("restaurantVo", restaurantVo);

        // 예약 밑밥 만들기 - 재준
        try {
            ReservationVO reservationVO = new ReservationVO();
            SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");

            // 비교할 시간 (문자열)
            String _openTime = restaurantVo.getOpenTime();
//            System.out.println("_openTime = " + _openTime);
            String _closeTime = restaurantVo.getCloseTime();
//            System.out.println("_closetime = " + _closeTime);
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
            }

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // 편의시설 조회
        List<ConvenienceVo> convenienceVo = restaurantService.findConven(no);
        System.out.println(convenienceVo);
        req.setAttribute("convenienceVo", convenienceVo);

        // 총 별점 조회
        List<StarAverageVo> starAverageVo = restaurantService.findStarAverage(no);
        System.out.println(starAverageVo);
        req.setAttribute("starAverageVo", starAverageVo);

        // 좋아요 여부
        User loginUser = (User) req.getSession().getAttribute("loginUser");
        if(loginUser != null) {
            Map<String, Object> param = new HashMap<>();
            param.put("usersNo", loginUser.getNo());
            param.put("restNo", restaurantVo.getNo());
            List<Attraction> attractions = attractionService.findByUsersNoRestNo(param);

            if(attractions.size() > 0){
                req.setAttribute("attractions", attractions);
                System.out.println(attractions);
            }
        }

        // 응답
        req.getRequestDispatcher("/WEB-INF/views/restaurant/restaurantDetail.jsp")
                .forward(req, resp);
    }
}