package com.leanly.mobile.chat.repository;

import com.leanly.mobile.chat.model.entity.Member;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface MemberRepository extends JpaRepository<Member, Long> {

    @Query(value = "select m from Member m left join fetch m.friends where m.id = :id")
    List<Member> getMemberFriends(@Param("id") Long id);
}