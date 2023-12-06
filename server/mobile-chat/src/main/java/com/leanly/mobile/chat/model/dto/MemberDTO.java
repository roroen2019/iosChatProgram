package com.leanly.mobile.chat.model.dto;

import lombok.Getter;

@Getter
public class MemberDTO {

    private String snsToken;
    private String type;
    private String nickName;

    public MemberDTO(String snsToken, String type, String nickName) {
        this.snsToken = snsToken;
        this.type = type;
        this.nickName = nickName;
    }

    protected MemberDTO() {
    }

}
