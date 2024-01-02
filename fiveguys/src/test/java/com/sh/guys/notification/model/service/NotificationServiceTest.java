package com.sh.guys.notification.model.service;

import com.sh.guys.notification.model.entity.Notification;
import com.sh.guys.notification.model.entity.Type;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;
import org.quartz.*;

import java.util.Date;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class NotificationServiceTest {
    private NotificatonService notificatonService;

    @BeforeEach
    @Test
    public void setUp() {
        this.notificatonService = new NotificatonService();
    }

    @Disabled
    @DisplayName("한 행의 알림 데이터를 기록한다")
    @ParameterizedTest
    @CsvSource({
        "woojin, NEW_COMMENT, 너무 맛있게 먹었어요 게시글에 댓글이 달렸습니다."
    })
    public void test1(String usersId, Type type, String content) {
        // given
        assertThat(usersId).isNotNull();
        assertThat(type).isNotNull();
        assertThat(content).isNotNull();
        // when
        Notification notification = new Notification();
        notification.setUsersId(usersId);
        notification.setType(type);
        notification.setContent(content);
        int result = notificatonService.insertNotification(notification);
        // then
        assertThat(result).isGreaterThan(0);
    }

    @DisplayName("특정회원의 확인 안한 알림 내역을 조회한다.")
    @ParameterizedTest
    @ValueSource(strings = {"woojin"})
    public void test2(String usersId) {
        // given
        assertThat(usersId).isNotNull();
        // when
        List<Notification> notifications = notificatonService.findById(usersId);
        System.out.println(notifications);
        // then
        assertThat(notifications)
                .isNotNull()
                .allSatisfy((notification) -> {
                   assertThat(notification.getNo()).isNotNull();
                   assertThat(notification.getUsersId()).isEqualTo(usersId);
                   assertThat(notification.getType()).isNotNull();
                   assertThat(notification.getContent()).isNotNull();
                   assertThat(notification.isChecked()).isFalse();
                   assertThat(notification.getRegDate()).isNotNull();
                });
    }

}
