package com.leanly.mobile.chat.service;

import com.leanly.mobile.chat.model.dto.FriendAddDTO;
import com.leanly.mobile.chat.model.dto.FriendDTO;
import com.leanly.mobile.chat.model.entity.Friend;

public interface FriendService {

    void saveFromMemberId(Friend fromMemberId);

    FriendDTO addFriendToMember(FriendAddDTO addDTO);

}
