package com.sh.guys.ws.endpoint;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sh.guys.common.FiveGuysUtils;
import com.sh.guys.common.LocalDateTimeSerializer;
import com.sh.guys.notification.model.entity.Notification;
import com.sh.guys.ws.config.FiveGuysWebSocketConfigurator;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint(value = "/echo", configurator = FiveGuysWebSocketConfigurator.class)
public class EchoWebSocket {
//    private static Gson gson;
//    static {
//        GsonBuilder builder = new GsonBuilder();
//        builder.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeSerializer());
//    }
    private static Gson gson = FiveGuysUtils.getGson();

    /**
     * 웹소켓세션관리를 위한 맵객체
     * - id=session
     * - 멀티쓰레드환경을 위한 동기화(쓰레드간 이용순서가 정해진, 한번에 하나의 쓰레드만 접근가능한)처리된 맵이 필요하다.
     */
    private static Map<String, Session> clientMap = Collections.synchronizedMap(new HashMap<>());
    private static void addToClientMap(String userId, Session session) {
        clientMap.put(userId, session);
        log();
    }

    /**
     * 개인별 실시간 알림 메소드
     * @param noti
     */
    public static void sendNotification(Notification noti) {
        Session session = clientMap.get(noti.getUsersId());
        if(session != null) {
            RemoteEndpoint.Basic basicRemote = session.getBasicRemote();
            try {
                basicRemote.sendText(gson.toJson(noti));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            System.out.println(noti.getUsersId() + "에 실시간 알림을 전송했습니다...");
        }
        else {
            System.out.println(noti.getUsersId() + "는 접속중이 아닙니다...");
        }
    }

    private void removeFromClientMap(String userId) {
        clientMap.remove(userId);
        log();
    }
    private static void log() {
        System.out.println(clientMap.size() + "명 접속중... " + clientMap.keySet());
    }


    @OnOpen
    public void open(EndpointConfig config, Session session) {
        System.out.print("[open] ");
        Map<String, Object> props = config.getUserProperties();
        String userId = (String) props.get("userId");
        System.out.println(userId + "님이 접속했습니다.");
        addToClientMap(userId, session);

        // 연결해제시 map에서 사용자제거를 위해 session의 내부맵에도 사용자id를 등록
        Map<String, Object> sessionProps = session.getUserProperties();
        sessionProps.put("userId", userId);
    }

    @OnMessage
    public void message(String msg, Session session) {
        System.out.println("message : " + msg);

        Collection<Session> sessions = clientMap.values();
        for(Session sess : sessions) {
            RemoteEndpoint.Basic basic = sess.getBasicRemote();
            try {
                basic.sendText(msg);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    @OnError
    public void error(Throwable e) {
        System.out.println("error");
        e.printStackTrace();
    }
    @OnClose
    public void close(Session session) {
        System.out.print("[close] ");
        Map<String, Object> sessionProps = session.getUserProperties();
        String userId = (String) sessionProps.get("userId");
        System.out.println(userId + "님이 접속해제했습니다.");
        removeFromClientMap(userId);
    }
}
