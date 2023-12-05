package com.leanly.mobile.chat.socket;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class CustomSocketHandler extends TextWebSocketHandler {

    private List<WebSocketSession> webSocketSessions = new ArrayList<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message)
        throws Exception {
        String payload = message.getPayload();
        System.out.println("payload: " + payload);

        for (WebSocketSession socketSession : webSocketSessions) {
            socketSession.sendMessage(message);
        }
    }

    /* Client가 접속 시 호출되는 메서드 */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        webSocketSessions.add(session);

        System.out.println(session + " 클라이언트 접속!!");
    }

    /* Client가 접속 해 제시 호출되는 메서드 */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
        throws Exception {
        webSocketSessions.remove(session);

        System.out.println(session + " 클라이언트 접속 해제!!");
    }
}
