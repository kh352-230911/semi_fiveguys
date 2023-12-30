package com.sh.guys.menu.model.vo;

import com.sh.guys.menu.model.entity.Menu;
import com.sh.guys.menu.model.entity.MenuPicture;

import java.util.ArrayList;
import java.util.List;

public class MenuVo extends Menu {
    private List<MenuPicture> menuPictures = new ArrayList<>();

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
