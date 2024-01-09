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

    public void addMenuPicture(MenuPicture menuPicture) {
        this.menuPictures.add(menuPicture);
    }

    @Override
    public String toString() {
        return "MenuVo{" +
                "menuPictures=" + menuPictures +
                "} " + super.toString();
    }

    public void setValue(String name, String value) {
        switch (name) {
            case "no" : this.setNo(value); break;
            case "restNo" : this.setRestNo(value); break;
            case "name" : this.setName(value); break;
            case "content" : this.setContent(value); break;
            case "price" : this.setPrice(Integer.parseInt(value)); break;
        }
    }
}
