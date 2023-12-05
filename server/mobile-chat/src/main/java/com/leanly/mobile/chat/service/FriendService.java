package com.leanly.mobile.chat.service;

import com.leanly.mobile.chat.model.entity.Friend;

public interface FriendService {

    void saveFromMemberId(Friend fromMemberId);

    void addMemberFriends(Friend friend);

}
