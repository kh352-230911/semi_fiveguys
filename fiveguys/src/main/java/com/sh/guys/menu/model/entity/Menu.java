package com.sh.guys.menu.model.entity;

public class Menu {
    private String no;
    private String restNo;
    private String name;
    private String content;
    private int price;

    public Menu() {
    }

    public Menu(String no, String restNo, String name, String content, int price) {
        this.no = no;
        this.restNo = restNo;
        this.name = name;
        this.content = content;
        this.price = price;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getRestNo() {
        return restNo;
    }

    public void setRestNo(String restNo) {
        this.restNo = restNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "no='" + no + '\'' +
                ", restNo='" + restNo + '\'' +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", price=" + price +
                '}';
    }
}
