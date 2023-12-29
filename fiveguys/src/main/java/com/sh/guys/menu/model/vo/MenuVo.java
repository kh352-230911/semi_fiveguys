package com.sh.guys.menu.model.vo;

import com.sh.guys.menu.model.entity.Menu;
import com.sh.guys.menu.model.entity.MenuPicture;

import java.util.ArrayList;
import java.util.List;

public class MenuVo extends Menu {
    private List<MenuPicture> menuPictures = new ArrayList<>();

    public MenuVo(String no, String restNo, String name, String content, int price, List<MenuPicture> menuPictures) {
        super(no, restNo, name, content, price);
        this.menuPictures = menuPictures;
    }

    public List<MenuPicture> getMenuPicture() {
        return menuPictures;
    }

    public void setMenuPicture(List<MenuPicture> menuPictures) {
        this.menuPictures = menuPictures;
    }

    @Override
    public String toString() {
        return "MenuVo{" +
                "menuPictures=" + menuPictures +
                "} " + super.toString();
    }
}
