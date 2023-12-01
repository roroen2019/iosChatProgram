package com.leanly.mobile.chat.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;

@Getter
@Entity
public class SnsLogin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String kakaoToken;
    private String appleToken;

    public SnsLogin() {
    }

    public SnsLogin(String kakaoToken, String appleToken) {
        this.kakaoToken = kakaoToken;
        this.appleToken = appleToken;
    }

    @Override
    public String toString() {
        return "SnsLogin{" +
            "id=" + id +
            ", kakaoToken='" + kakaoToken + '\'' +
            ", appleToken='" + appleToken + '\'' +
            '}';
    }
}
