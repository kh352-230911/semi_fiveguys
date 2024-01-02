package com.sh.guys.notification.model.entity;

public enum Type {
    NEW_REVIEW, // 새 리뷰가 달렸을 때
    NEW_COMMENT, // 새 댓글이 달렸을 때
    RECOGNIZE, // 승인이 필요할 때
    NEW_FOLLOWER, // 좋아요가 추가 됐을 때
    RESERVATION_TIME // 예약 1시간 전일때
}
