package com.leanly.mobile.chat.service.impl;

import com.leanly.mobile.chat.model.entity.Member;
import com.leanly.mobile.chat.repository.MemberRepository;
import com.leanly.mobile.chat.service.MemberService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    private MemberRepository memberRepository;

    @Autowired
    public MemberServiceImpl(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    @Override
    public List<Member> getMemberFriends(Long id) {
        return memberRepository.getMemberFriends(id);
    }

    @Override
    public Member getMember(Long id) {
        return memberRepository.findById(id).get();
    }

    @Override
    public Member saveEntity(Member member) {
        return memberRepository.save(member);
    }

    @Override
    public void updateEntity(Member member) {
        Member findMember = memberRepository.findById(member.getId()).get();

        Member updateMember = new Member(
            findMember.getName(),
            findMember.getProfileImg(),
            findMember.getSubMessage()
        );

        memberRepository.save(updateMember);
    }

    @Override
    public void deleteEntity(Member member) {
        memberRepository.delete(member);
    }
}
