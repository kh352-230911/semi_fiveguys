package com.sh.guys.notification.model.entity;

import java.time.LocalDateTime;

public class Notification {
    private String no;
    private String usersId;
    private Type type;
    private String content;
    private boolean checked;
    private LocalDateTime regDate;

    public Notification() {
    }

    public Notification(String no, String usersId, Type type, String content, boolean checked, LocalDateTime regDate) {
        this.no = no;
        this.usersId = usersId;
        this.type = type;
        this.content = content;
        this.checked = checked;
        this.regDate = regDate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getUsersId() {
        return usersId;
    }

    public void setUsersId(String usersId) {
        this.usersId = usersId;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "Notification{" +
                "no='" + no + '\'' +
                ", usersNo='" + usersId + '\'' +
                ", type=" + type +
                ", content='" + content + '\'' +
                ", checked=" + checked +
                ", regDate=" + regDate +
                '}';
    }
}
