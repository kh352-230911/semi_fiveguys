package com.sh.guys.restaurant.model.vo;

import com.sh.guys.attraction.model.entity.Attraction;
import com.sh.guys.menu.model.entity.Menu;
import com.sh.guys.menu.model.entity.MenuPicture;
import com.sh.guys.reservation.model.entity.Reservation;
import com.sh.guys.restaurant.model.entity.Restaurant;
import com.sh.guys.user.model.entity.User;

import java.util.ArrayList;
import java.util.List;

public class RestaurantVo extends Restaurant {
    private List<Menu> menus = new ArrayList<>();
    private List<MenuPicture> menuPictures = new ArrayList<>();
    private Attraction attraction;
    private int attractionCount;
    private User user;
    private List<Reservation> reservations = new ArrayList<>();

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Attraction getAttraction() {
        return attraction;
    }

    public void setAttraction(Attraction attraction) {
        this.attraction = attraction;
    }

    public int getAttractionCount() {
        return attractionCount;
    }

    public void setAttractionCount(int attractionCount) {
        this.attractionCount = attractionCount;
    }

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
                ", attraction=" + attraction +
                ", attractionCount=" + attractionCount +
                ", user=" + user +
                ", reservations=" + reservations +
                "} " + super.toString();
    }
}
