package com.sh.guys.menu.model.entity;

public class Menu {
    private String menuNo;
    private String restNo;
    private String menuName;
    private String menuContent;
    private int menuPrice;

    public Menu() {}

    public Menu(String menuNo, String restNo, String menuName, String menuContent, int menuPrice) {
        this.menuNo = menuNo;
        this.restNo = restNo;
        this.menuName = menuName;
        this.menuContent = menuContent;
        this.menuPrice = menuPrice;
    }

    public String getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(String menuNo) {
        this.menuNo = menuNo;
    }

    public String getRestNo() {
        return restNo;
    }

    public void setRestNo(String restNo) {
        this.restNo = restNo;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuContent() {
        return menuContent;
    }

    public void setMenuContent(String menuContent) {
        this.menuContent = menuContent;
    }

    public int getMenuPrice() {
        return menuPrice;
    }

    public void setMenuPrice(int menuPrice) {
        this.menuPrice = menuPrice;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "menuNo='" + menuNo + '\'' +
                ", restNo='" + restNo + '\'' +
                ", menuName='" + menuName + '\'' +
                ", menuContent='" + menuContent + '\'' +
                ", menuPrice=" + menuPrice +
                '}';
    }
}
