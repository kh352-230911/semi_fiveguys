package com.sh.guys.reservation.service;

import com.sh.guys.reservation.model.entity.CancelReservations;
import com.sh.guys.reservation.model.entity.Reservations;
import com.sh.guys.reservation.model.service.ReservationService;
import com.sh.guys.restaurant.model.entity.Reservation;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

public class ReservationsServiceTest {
    private ReservationService reservationService;

    @BeforeEach
    @Test
    public void setUp() {
        this.reservationService = new ReservationService();
    }

    @DisplayName("취소된 예약을 모두 조회할 수 있다.")
    @Test
    public void test1() {
        List<CancelReservations> reservations = reservationService.cancelReservationFindAll();
        System.out.println(reservations);
        assertThat(reservations).isNotNull()
                .allSatisfy((reservation) -> {
                   assertThat(reservation.getNo()).isNotNull();
                   assertThat(reservation.getRestNo()).isNotNull();
                   assertThat(reservation.getUsersNo()).isNotNull();
                   assertThat(reservation.getReservName()).isNotNull();
                   assertThat(reservation.getReservDate()).isNotNull();
                   assertThat(reservation.getReservTime()).isNotNull();
                   assertThat(reservation.getRegDate()).isNotNull();
                });
    }

    @DisplayName("모든 예약 내역을 조회할 수 있다.")
    @Test
    public void test2() {
        List<Reservations> reservations = reservationService.findAll();
        System.out.println(reservations);
        assertThat(reservations).isNotNull()
                .allSatisfy((reservation) -> {
                    assertThat(reservation.getNo()).isNotNull();
                    assertThat(reservation.getRestNo()).isNotNull();
                    assertThat(reservation.getUsersNo()).isNotNull();
                    assertThat(reservation.getReservName()).isNotNull();
                    assertThat(reservation.getReservDate()).isNotNull();
                    assertThat(reservation.getReservTime()).isNotNull();
                    assertThat(reservation.getRegDate()).isNotNull();
                });
    }
}
