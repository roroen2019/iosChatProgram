package com.leanly.mobile.chat.repository;

import com.leanly.mobile.chat.model.entity.Friend;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FriendRepository extends JpaRepository<Friend, Long> {

}
