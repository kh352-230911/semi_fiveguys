package com.sh.guys.notification.model.dao;

import com.sh.guys.notification.model.entity.Notification;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class NotificationDao {
    public static List<Notification> findById(SqlSession session, String id) {
        return session.selectList("notification.findByUsersId", id);
    }

    public int insertNotification(SqlSession session, Notification notification) {
        return session.insert("notification.insertNotification", notification);
    }
}
