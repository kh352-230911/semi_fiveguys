package com.sh.guys.user.model.entity;


import java.time.LocalDate;
import java.util.List;

public class User {
    private String no;
    private String id;
    private String password;
    private String name;
    private String nickName;
    private Gender gender;

    private String email;
    private String phone;
    private Role role;
    private List<String> category;
    private LocalDate regDate;

    public User() {}

    public User(String no, String id, String password, String name, String nickName, Gender gender, String email, String phone, Role role, List<String> category, LocalDate regDate) {
        this.no = no;
        this.id = id;
        this.password = password;
        this.name = name;
        this.nickName = nickName;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.category = category;
        this.regDate = regDate;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public List<String> getCategory() {return category;

    }

    public void setCategory(List<String> category) {
        this.category = category;
    }

    public LocalDate getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDate regDate) {
        this.regDate = regDate;
    }

    @Override
    public String toString() {
        return "User{" +
                "no='" + no + '\'' +
                ", id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", nickName='" + nickName + '\'' +
                ", gender=" + gender +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", role=" + role +
                ", category='" + category + '\'' +
                ", regDate=" + regDate +
                '}';
    }
}