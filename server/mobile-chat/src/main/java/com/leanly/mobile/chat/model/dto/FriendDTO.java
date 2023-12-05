package com.leanly.mobile.chat.model.dto;

import com.leanly.mobile.chat.model.entity.Member;
import java.util.List;
import lombok.Getter;

@Getter
public class FriendDTO {

    private List<Member> friendsInfo;
//    private Long memberId;

    public FriendDTO(List<Member> friendsInfo) {
        this.friendsInfo = friendsInfo;
//        this.memberId = memberId;
    }
}
