package com.jeesun.thymelte.repository;

import com.jeesun.thymelte.domain.QrCode;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QrCodeRepository extends JpaRepository<QrCode, Long> {
    QrCode findBySid(String sid);
}
