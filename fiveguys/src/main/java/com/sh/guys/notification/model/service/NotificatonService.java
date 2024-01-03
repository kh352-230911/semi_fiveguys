package com.sh.guys.notification.model.service;

import com.sh.guys.notification.model.dao.NotificationDao;
import com.sh.guys.notification.model.entity.Notification;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class NotificatonService {
    private NotificationDao notificationDao = new NotificationDao();

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
}
