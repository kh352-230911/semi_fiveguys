package com.sh.guys.common;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import javax.servlet.ServletContext;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Base64;

public class FiveGuysUtils {
    public static ServletContext servletContext;
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

    public static Gson getGson() {
        return new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, GsonConverter.LOCAL_DATE_SERIALIZER)
                .registerTypeAdapter(LocalDate.class, GsonConverter.LOCAL_DATE_DESERIALIZER)
                .registerTypeAdapter(LocalDateTime.class, GsonConverter.LOCAL_DATE_SERIALIZER)
                .registerTypeAdapter(LocalDateTime.class, GsonConverter.LOCAL_DATE_DESERIALIZER)
                .create();
    }

    public static String getNotification(String content, String url) {
        url = servletContext.getContextPath() + url;
        return "<a href=\"%s\" class=\"hover:underline text-blue-500\">%s</a>"
                .formatted(url, content);
    }
}
