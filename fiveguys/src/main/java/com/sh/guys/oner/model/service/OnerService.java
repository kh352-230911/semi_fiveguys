package com.sh.guys.oner.model.service;

import com.sh.guys.oner.model.dao.OnerDao;
import com.sh.guys.oner.model.vo.OwnerReservationVo;
import com.sh.guys.restaurant.model.entity.Restaurant;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class OnerService {
    private OnerDao onerDao = new OnerDao();

    public List<Restaurant> findMyRestaurant(String userNo) {
        SqlSession session = getSqlSession();
        List<Restaurant> restaurants = onerDao.findMyRestaurant(session, userNo);
        session.close();
        return restaurants;
    }

    // github
    public List<OwnerReservationVo> findOwnerRestaurant(String no) {
        SqlSession session =getSqlSession();
        List<OwnerReservationVo> ownerReservationVo = onerDao.findOwnerRestaurant(session, no);
        session.close();
        return ownerReservationVo;
    }
    // end
}
