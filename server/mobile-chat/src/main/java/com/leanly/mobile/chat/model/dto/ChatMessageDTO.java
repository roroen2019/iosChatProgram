package com.leanly.mobile.chat.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageDTO {

    @Schema(
        description = "Chat Room Id",
        example = "axew123-ropkk31hgsw-32ddpe"
    )
    private String roomId;
    @Schema(
        description = "Chat Room writer",
        example = "신짱구"
    )
    private String writer;
    @Schema(
        description = "Chat Room message",
        example = "오늘 날씨가 좋다!!"
    )
    private String message;
    @Schema(
        description = "Chat Room stats",
        example = "0(입장) or 1(대화)"
    )
    private int stats;

}
