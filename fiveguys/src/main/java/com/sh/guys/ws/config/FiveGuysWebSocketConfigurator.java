package com.sh.guys.ws.config;

import com.sh.guys.user.model.entity.User;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import java.util.Map;

public class FiveGuysWebSocketConfigurator extends ServerEndpointConfig.Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
        HttpSession session = (HttpSession) request.getHttpSession();
        User loginUser = (User) session.getAttribute("loginUser");
        String userId = loginUser.getId();

        Map<String, Object> props = sec.getUserProperties();
        props.put("userId", userId);
    }
}
