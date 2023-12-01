package com.leanly.mobile.chat.repository;

import com.leanly.mobile.chat.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
    
}
