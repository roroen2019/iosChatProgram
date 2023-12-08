package com.leanly.mobile.chat.model.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema.AccessMode;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor
@Schema(description = "SnsInfo Entity Information")
public class SnsInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(
        accessMode = AccessMode.READ_ONLY,
        description = "snsInfo id",
        example = "10000"
    )
    private Long id;

    @Schema(
        description = "snsInfo token",
        example = "xhe12nkvdvskkod0000"
    )
    private String token;

    @Schema(
        description = "snsInfo type",
        example = "kakao, apple"
    )
    private String type;

    public SnsInfo(String token, String type) {
        this.token = token;
        this.type = type;
    }

    @Override
    public String toString() {
        return "SnsInfo{" +
            "id=" + id +
            ", name='" + token + '\'' +
            ", profileImg='" + type + '\'' +
            '}';
    }
}
