package com.leanly.mobile.chat.model.dto;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import lombok.Getter;
import org.springframework.web.socket.WebSocketSession;

/*
 * 하나의 채팅방에 모이는 것이 아닌
 * private 공간에서 채팅할 수 있도록 채팅방을 생성
 * */
@Getter
public class ChatRoomDTO {

    private String roomId;
    private String name;
    private Set<WebSocketSession> sessions = new HashSet<>();

    public static ChatRoomDTO create(String name) {
        ChatRoomDTO chatRoomDTO = new ChatRoomDTO();

        chatRoomDTO.roomId = UUID.randomUUID().toString();
        chatRoomDTO.name = name;
        return chatRoomDTO;
    }

}
