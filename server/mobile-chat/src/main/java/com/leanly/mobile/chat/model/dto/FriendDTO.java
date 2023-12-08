package com.leanly.mobile.chat.model.dto;

import lombok.Getter;

@Getter
public class FriendDTO {

    private Long id;
    private String name;
    private String profileImg;
    private String subMessage;

    public FriendDTO(Long id, String name, String profileImg, String subMessage) {
        this.id = id;
        this.name = name;
        this.profileImg = profileImg;
        this.subMessage = subMessage;
    }
}
