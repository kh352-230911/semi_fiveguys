package com.sh.guys.reservation.model.service;

import com.sh.guys.reservation.model.dao.ReservationDao;
import com.sh.guys.reservation.model.entity.CancelReservations;
import com.sh.guys.reservation.model.entity.Reservations;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

import static com.sh.guys.common.SqlSessionTemplate.getSqlSession;

public class ReservationService {
    private ReservationDao reservationDao = new ReservationDao();

    public List<CancelReservations> cancelReservationFindAll() {
        SqlSession session = getSqlSession();
        List<CancelReservations> reservations = reservationDao.cancelReservationFindAll(session);
        session.close();
        return reservations;
    }

    public List<Reservations> findAll() {
        SqlSession session = getSqlSession();
        List<Reservations> reservations = reservationDao.findAll(session);
        session.close();
        return reservations;
    }
}
