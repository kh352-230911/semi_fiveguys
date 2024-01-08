package com.sh.guys.reservation.model.service;

import com.sh.guys.reservation.model.dao.ReservationDao;
import com.sh.guys.reservation.model.entity.CancelReservation;
import com.sh.guys.reservation.model.entity.Reservation;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class ReservationService {
    private ReservationDao reservationDao = new ReservationDao();

    public List<CancelReservation> cancelReservationFindAll() {
        SqlSession session = getSqlSession();
        List<CancelReservation> reservations = reservationDao.cancelReservationFindAll(session);
        session.close();
        return reservations;
    }

    public List<Reservation> findAll() {
        SqlSession session = getSqlSession();
        List<Reservation> reservations = reservationDao.findAll(session);
        session.close();
        return reservations;
    }

    public int insertReservation(Reservation reservation) {
        SqlSession session = getSqlSession();
        int result = 0;
        try {
            result = reservationDao.insertReservation(session, reservation);
            session.commit();
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
        return result;
    }

    public int countReservation(Reservation reservation) {
        SqlSession session = getSqlSession();
        int result = reservationDao.countReservation(session, reservation);
        session.close();
        return result;
    }
}
