package com.leanly.mobile.chat.service;

import com.leanly.mobile.chat.model.entity.Member;
import java.util.List;

public interface MemberService {

    List<Member> getMemberFriends(Long id);

    Member getMember(Long id);

    Member saveEntity(Member member);

    void updateEntity(Member member);

    void deleteEntity(Member member);

}
