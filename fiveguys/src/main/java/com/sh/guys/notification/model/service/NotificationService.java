package com.sh.guys.notification.model.service;

import com.sh.guys.notification.model.dao.NotificationDao;
import com.sh.guys.notification.model.entity.Notification;
import com.sh.guys.notification.model.entity.Type;
import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.restaurant.model.service.RestaurantService;
import com.sh.guys.restaurant.model.vo.RestaurantVo;
import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.service.ReviewService;
import com.sh.guys.user.model.entity.Role;
import com.sh.guys.user.model.entity.User;
import com.sh.guys.user.model.service.UserService;
import com.sh.guys.ws.endpoint.EchoWebSocket;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.FiveGuysUtils.*;
import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class NotificationService {
    final String TEMPLATE_OF_NEW_REVIEW_COMMENT_NOTIFICATION = "%s님이 %s 게시글에 댓글을 작성했습니다.";
    final String TEMPLATE_OF_NEW_RECOGNIZE_NOTIFICATION = "%s님이 승인요청을 보냈습니다.";
    final String TEMPLATE_OF_NEW_RESERVATION_NOTIFICATION = "%s님이 예약을 하셨습니다.";
    private NotificationDao notificationDao = new NotificationDao();
    private ReviewService reviewService = new ReviewService();
    private UserService userService = new UserService();
    private RestaurantService restaurantService = new RestaurantService();

    public int insertNotification(Notification notification) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = notificationDao.insertNotification(session, notification);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public List<Notification> findByUserId(String userId) {
        SqlSession session = getSqlSession();
        List<Notification> notifications = notificationDao.findByUserId(session, userId);
        session.close();
        return notifications;
    }

//    public int notify(ReviewComment comment) {
//        String reviewNo = comment.getReviewNo();
//        Review review = reviewService.findByNo(reviewNo);
//
//        // 댓글이 달린 게시글의 작성자용 알림 생성
//        Notification noti = new Notification();
//        noti.setUsersId(review.getUsersNo());
//        String content = TEMPLATE_OF_NEW_REVIEW_COMMENT_NOTIFICATION.formatted(
//                getReviewCommentNotification(comment.getUsersNo(), "/member/memberView?id=" + comment.getUsersNo()),
//                getReviewCommentNotification(review.getContent(), "/board/boardDetail?id=" + review.getNo())
//        );
//        noti.setContent(content);
//        noti.setType(Type.NEW_COMMENT);
//
//        // 1. 실시간 알림
//        EchoWebSocket.sendNotification(noti);
//        // 2. 알림 테이블 등록
//        return insertNotification(noti);
//    }

    public int recognize(String id){
        String usersId = id;
        List<User> users = userService.findAll();
        Notification noti = new Notification();

        users.forEach((user) -> {
            if(user.getRole() == Role.M) {
                noti.setUsersId(user.getId());
                String content = TEMPLATE_OF_NEW_RECOGNIZE_NOTIFICATION.formatted(
                        getRecognizeNotification(id, "/admin/adminApprovalList")
                );
                noti.setContent(content);
                noti.setType(Type.RECOGNIZE);
                EchoWebSocket.sendNotification(noti);
            }
        });
        return insertNotification(noti);
    }

    public int reservation(String id, String restNo) {
        String no = restNo;
        RestaurantVo restaurantVo = restaurantService.findByUsersId(no);

        String userId = restaurantVo.getUser().getId();

        Notification noti = new Notification();
        noti.setUsersId(userId);
        String content = TEMPLATE_OF_NEW_RESERVATION_NOTIFICATION.formatted(
                getReservationNotification(id, "/oner/onerReservationList")
        );
        noti.setContent(content);
        noti.setType(Type.RESERVATION_CONFIRM);

        EchoWebSocket.sendNotification(noti);

        return insertNotification(noti);
    }

    public int deleteNoti(String no) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = notificationDao.deleteNoti(session, no);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }
}