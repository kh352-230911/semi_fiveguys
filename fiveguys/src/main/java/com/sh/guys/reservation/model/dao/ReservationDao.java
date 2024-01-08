package com.sh.guys.reservation.model.dao;

import com.sh.guys.reservation.model.entity.CancelReservation;
import com.sh.guys.reservation.model.entity.Reservation;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReservationDao {
    public List<CancelReservation> cancelReservationFindAll(SqlSession session) {
        return session.selectList("cancelReservation.cancelReservationFindAll");
    }

    public List<Reservation> findAll(SqlSession session) {
        return session.selectList("reservation.findAll");
    }

    public int insertReservation(SqlSession session, Reservation reservation) {
        return session.insert("reservation.insertReservation", reservation);
    }

    public int countReservation(SqlSession session, Reservation reservation) {
        return session.selectOne("reservation.countReservation", reservation);
    }

    public int cancelReservation(SqlSession session, String reservNo) {
        return session.delete("reservation.cancelReservation", reservNo);
    }
}
