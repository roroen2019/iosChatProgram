package com.leanly.mobile.chat.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import java.util.UUID;
import lombok.Getter;

/*
 * 하나의 채팅방에 모이는 것이 아닌
 * private 공간에서 채팅할 수 있도록 채팅방을 생성
 * */
@Getter
public class ChatRoomDTO {

    @Schema(
        description = "Chat Room Id",
        example = "axew123-ropkk31hgsw-32ddpe"
    )
    private String roomId;
    @Schema(
        description = "Chat Room Id",
        example = "개발자들의 채팅방"
    )
    private String name;

    public ChatRoomDTO() {
    }

    public ChatRoomDTO(String roomId, String name) {
        this.roomId = roomId;
        this.name = name;
    }


    public static ChatRoomDTO create(String name) {
        ChatRoomDTO chatRoomDTO = new ChatRoomDTO();

        chatRoomDTO.roomId = UUID.randomUUID().toString();
        chatRoomDTO.name = name;
        return chatRoomDTO;
    }


}
