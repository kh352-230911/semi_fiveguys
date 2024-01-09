package com.sh.guys.notification.model.dao;

import com.sh.guys.notification.model.entity.Notification;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class NotificationDao {

    public int insertNotification(SqlSession session, Notification notification) {
        return session.insert("notification.insertNotification", notification);
    }

    public List<Notification> findByUserId(SqlSession session, String userId) {
        return session.selectList("notification.findByUserId", userId);
    }

    public int deleteNoti(SqlSession session, String no) {
        return session.delete("notification.deleteNoti", no);
    }
}
