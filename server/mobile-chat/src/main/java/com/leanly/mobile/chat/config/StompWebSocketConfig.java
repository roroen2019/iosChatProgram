package com.leanly.mobile.chat.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker // stomp 를 사용하기 위해 선언하는 어노테이션
public class StompWebSocketConfig implements WebSocketMessageBrokerConfigurer {

    /*
     * endpoint를 /stomp로 하고, allowedOrigins를 "*"로 하면 안되는 이유
     * */
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry
            .addEndpoint("/stomp/chat")
            .setAllowedOrigins("http://localhost:8888")
            .withSockJS();
    }

    /* 애플리케이션 내부에서 사용할 path를 지정할 수 있다 */
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        /*
         * Client에서 SEND 요청을 처리
         * spring docs 에서는 /app 으로 예시
         * */
        config.setApplicationDestinationPrefixes("/pub");
        /*
         * 해당 경로로 SimpleBroker를 등록
         * SimpleBroker는 해당하는 경로를 SUBSCRIBE 하는 Client에게 메시지를 전달하는 간단한 작업을 수행
         * spring docs 에서는 /topic , /queue 로 예시
         * */
        config.enableSimpleBroker("/sub");
    }
}
