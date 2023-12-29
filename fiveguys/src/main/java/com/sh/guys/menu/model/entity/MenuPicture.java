package com.sh.guys.menu.model.entity;

import com.sh.guys.menu.model.entity.Menu;

public class MenuPicture{
    private String no;
    private String menuNo;
    private String renamedFilename;

    public MenuPicture() {
    }

    public MenuPicture(String no, String menuNo, String renamedFilename) {
        this.no = no;
        this.menuNo = menuNo;
        this.renamedFilename = renamedFilename;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getMenuNo() {
        return menuNo;
    }

    public void setMenuNo(String menuNo) {
        this.menuNo = menuNo;
    }

    public String getRenamedFilename() {
        return renamedFilename;
    }

    public void setRenamedFilename(String renamedFilename) {
        this.renamedFilename = renamedFilename;
    }

    @Override
    public String toString() {
        return "MenuPicture{" +
                "no='" + no + '\'' +
                ", menuNo='" + menuNo + '\'' +
                ", renamedFilename='" + renamedFilename + '\'' +
                '}';
    }
}
