package com.leanly.mobile.chat.model;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema.AccessMode;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.Getter;

@Entity
@Getter
@Schema(description = "User Model Information")
public class User {

    @Id
    @GeneratedValue
    @Schema(
        accessMode = AccessMode.READ_ONLY,
        description = "User Id",
        example = "10000"
    )
    private Long id;
    @Schema(
        description = "User name",
        example = "사용자A"
    )
    private String name;
    @Schema(
        description = "User profile image",
        example = "http://drive.goolge.com/background.png"
    )
    private String profileImg;
    @Schema(
        description = "User sub message",
        example = "오늘 하루도 고생했다!!"
    )
    private String subMessage;

    public User() {
    }

    public User(String name, String profileImg, String subMessage) {
        this.name = name;
        this.profileImg = profileImg;
        this.subMessage = subMessage;
    }

    public void changeId(Long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "User{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", profileImg='" + profileImg + '\'' +
            ", subMessage='" + subMessage + '\'' +
            '}';
    }
}


