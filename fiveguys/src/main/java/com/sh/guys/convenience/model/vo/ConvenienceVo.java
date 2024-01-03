package com.sh.guys.convenience.model.vo;

import com.sh.guys.convenience.model.entity.Convenience;
import com.sh.guys.restaurant.model.entity.Restaurant;

import java.util.ArrayList;
import java.util.List;

public class ConvenienceVo extends Restaurant {
    private String restNo;
    private String convenNo;

    private List<Convenience> conveniences = new ArrayList<>();

    public String getRestNo() {
        return restNo;
    }

    public void setRestNo(String restNo) {
        this.restNo = restNo;
    }

    public String getConvenNo() {
        return convenNo;
    }

    public void setConvenNo(String convenNo) {
        this.convenNo = convenNo;
    }

    public List<Convenience> getConveniences() {
        return conveniences;
    }

    public void setConveniences(List<Convenience> conveniences) {
        this.conveniences = conveniences;
    }

    @Override
    public String toString() {
        return "ConvenienceVo{" +
                "restNo='" + restNo + '\'' +
                ", convenNo='" + convenNo + '\'' +
                ", conveniences=" + conveniences +
                "} " + super.toString();
    }
}
