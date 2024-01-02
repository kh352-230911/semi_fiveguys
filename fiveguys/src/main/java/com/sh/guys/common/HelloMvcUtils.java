package com.sh.guys.common;

import java.beans.Encoder;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class HelloMvcUtils {
    /**
     * 암호화
     * 1.MessageDigest (암호화)
     * 2. Encodin (이진데이터를 텍스트로 변환)
     * @param password
     * @return
     */
    public static String getEncryptedPassword(String password, String salt) {
        String encryptedPassword = null;
        try {
            // 1. 암호화 (hashing)
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            byte[] input = password.getBytes("UTF-8");
            byte[] saltInput = salt.getBytes("UTF-8");
            md.update(saltInput);
            byte[] output = md.digest(input); // 이진데이터

            // 2. 인코딩 (64개문자 - 영대소문자(52), 숫자(10), +, /) + padding(=)
            Base64.Encoder encoder = Base64.getEncoder();
            encryptedPassword = encoder.encodeToString(output);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
        return encryptedPassword;
    }
}
