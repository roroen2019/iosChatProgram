package com.leanly.mobile.chat.model.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema.AccessMode;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import java.util.LinkedHashSet;
import java.util.Set;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(
        accessMode = AccessMode.READ_ONLY,
        description = "Member Id",
        example = "10000"
    )
    private Long id;
    @Schema(
        description = "Member name",
        example = "사용자A"
    )
    private String name;
    @Schema(
        description = "Member profile image",
        example = "http://drive.goolge.com/background.png"
    )
    private String profileImg;
    @Schema(
        description = "Member sub message",
        example = "오늘 하루도 고생했다!!"
    )
    private String subMessage;


    @OneToMany(mappedBy = "member", fetch = FetchType.LAZY)
    private Set<Friend> friends = new LinkedHashSet<>();

    public Member(String name, String profileImg, String subMessage) {
        this.name = name;
        this.profileImg = profileImg;
        this.subMessage = subMessage;
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