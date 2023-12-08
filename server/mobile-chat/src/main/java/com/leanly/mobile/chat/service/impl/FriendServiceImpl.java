package com.leanly.mobile.chat.service.impl;

import com.leanly.mobile.chat.model.dto.FriendAddDTO;
import com.leanly.mobile.chat.model.dto.FriendDTO;
import com.leanly.mobile.chat.model.entity.Friend;
import com.leanly.mobile.chat.model.entity.Member;
import com.leanly.mobile.chat.repository.FriendRepository;
import com.leanly.mobile.chat.repository.MemberRepository;
import com.leanly.mobile.chat.service.FriendService;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FriendServiceImpl implements FriendService {

    private FriendRepository friendRepository;
    private MemberRepository memberRepository;

    @Autowired
    public FriendServiceImpl(FriendRepository friendRepository, MemberRepository memberRepository) {
        this.friendRepository = friendRepository;
        this.memberRepository = memberRepository;
    }

    @Override
    public void saveFromMemberId(Friend fromMemberId) {
        friendRepository.save(fromMemberId);
    }

    @Override
    public FriendDTO addFriendToMember(FriendAddDTO addDTO) {
        // 친구 테이블에서 본인 행 가져오기
        // 멤버 테이블에서 친구 행 가져오기
        // 친구 테이블에 추가한 친구(멤버) 저장
        Friend findFromMember = friendRepository.findFromMember(addDTO.getFrom_member_id());
        Optional<Member> optionalMember = memberRepository.findById(addDTO.getTo_member_id());

        Member member = optionalMember.get();
        findFromMember.setMember(member);

        friendRepository.save(findFromMember);

        FriendDTO friendDTO = new FriendDTO(
            member.getId(),
            member.getName(),
            member.getProfileImg(),
            member.getSubMessage()
        );

        return friendDTO;
    }
}
