package com.sh.guys.notification.model.service;

import com.sh.guys.notification.model.dao.NotificationDao;
import com.sh.guys.notification.model.entity.Notification;
import com.sh.guys.notification.model.entity.Type;
import com.sh.guys.review.model.entity.Review;
import com.sh.guys.review.model.entity.ReviewComment;
import com.sh.guys.review.model.service.ReviewService;
import com.sh.guys.ws.endpoint.EchoWebSocket;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.FiveGuysUtils.getReviewCommentNotification;
import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class NotificationService {
    final String TEMPLATE_OF_NEW_REVIEW_COMMENT_NOTIFICATION = "%s님이 %s 게시글에 댓글을 작성했습니다.";
    private NotificationDao notificationDao = new NotificationDao();
    private ReviewService reviewService = new ReviewService();

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

    public int notify(ReviewComment comment) {
        String reviewNo = comment.getReviewNo();
        Review review = reviewService.findByNo(reviewNo);

        // 댓글이 달린 게시글의 작성자용 알림 생성
        Notification noti = new Notification();
        noti.setUsersId(review.getUsersNo());
        String content = TEMPLATE_OF_NEW_REVIEW_COMMENT_NOTIFICATION.formatted(
                getReviewCommentNotification(comment.getUsersNo(), "/member/memberView?id=" + comment.getUsersNo()),
                getReviewCommentNotification(review.getContent(), "/board/boardDetail?id=" + review.getNo())
        );
        noti.setContent(content);
        noti.setType(Type.NEW_COMMENT);

        // 1. 실시간 알림
        EchoWebSocket.sendNotification(noti);
        // 2. 알림 테이블 등록
        return insertNotification(noti);
    }
}
