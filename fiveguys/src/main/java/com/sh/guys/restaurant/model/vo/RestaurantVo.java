package com.sh.guys.restaurant.model.vo;

import com.sh.guys.menu.model.entity.Menu;
import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.restaurant.model.entity.Reservation;
import com.sh.guys.restaurant.model.entity.Restaurant;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class RestaurantVo extends Restaurant {
    private List<Menu> menus = new ArrayList<>();
    private List<MenuPicture> menuPictures = new ArrayList<>();

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public List<MenuPicture> getMenuPictures() {
        return menuPictures;
    }

    public void setMenuPictures(List<MenuPicture> menuPictures) {
        this.menuPictures = menuPictures;
    }

    @Override
    public String toString() {
        return "RestaurantVo{" +
                "menus=" + menus +
                ", menuPictures=" + menuPictures +
                "} " + super.toString();
    }
}
