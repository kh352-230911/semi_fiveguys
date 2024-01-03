package com.sh.guys.user.model.entity;

import java.time.LocalDate;
import java.util.List;

public class UserDel extends User{
    public UserDel() {
    }

    public UserDel(String no, String id, String password, String name, String nickName, Gender gender, String email, String phone, Role role, List<String> category, LocalDate regDate) {
        super(no, id, password, name, nickName, gender, email, phone, role, category, regDate);
    }

    @Override
    public String toString() {
        return "UserDel{} " + super.toString();
    }
}
