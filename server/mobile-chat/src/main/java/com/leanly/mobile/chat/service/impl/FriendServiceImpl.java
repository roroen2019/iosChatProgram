package com.leanly.mobile.chat.service.impl;

import com.leanly.mobile.chat.model.entity.Friend;
import com.leanly.mobile.chat.repository.FriendRepository;
import com.leanly.mobile.chat.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FriendServiceImpl implements FriendService {

    private FriendRepository friendRepository;

    @Autowired
    public FriendServiceImpl(FriendRepository friendRepository) {
        this.friendRepository = friendRepository;
    }

    @Override
    public void saveFromMemberId(Friend fromMemberId) {
        friendRepository.save(fromMemberId);
    }

    @Override
    public void addMemberFriends(Friend friend) {
        // 친구를 추가한다
        // 데이터베이스의 맴버 테이블의 고유한 키 값이 존재하는지 확인 (클라이언트에서 고유한 키 값을 준다고 판단?)
        // 존재한다면, 친구 테이블의 본인 키 값과, 친구 키 값을 추가한다.

    }
}
