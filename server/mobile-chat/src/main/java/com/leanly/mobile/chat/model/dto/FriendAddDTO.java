package com.leanly.mobile.chat.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;

@Getter
public class FriendAddDTO {

    @Schema(
        description = "유저 고유 아이디",
        example = ""
    )
    private Long from_member_id;
    @Schema(
        description = "",
        example = "친구 추가할 유저 고유 아이디"
    )
    private Long to_member_id;
}
