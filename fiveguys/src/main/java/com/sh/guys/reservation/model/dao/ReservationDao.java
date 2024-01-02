package com.sh.guys.reservation.model.dao;

import com.sh.guys.reservation.model.entity.CancelReservations;
import com.sh.guys.reservation.model.entity.Reservations;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReservationDao {
    public List<CancelReservations> cancelReservationFindAll(SqlSession session) {
        return session.selectList("cancelReservations.cancelReservationFindAll");
    }

    public List<Reservations> findAll(SqlSession session) {
        return session.selectList("reservation.findAll");
    }
}
