package com.leanly.mobile.chat.model.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema.AccessMode;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@Schema(description = "Friend Entity Information")
@NoArgsConstructor
public class Friend {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Schema(
        accessMode = AccessMode.READ_ONLY,
        description = "primary key",
        example = "10"
    )
    private Long id;

    @Schema(
        description = "from member id",
        example = "10"
    )
    private Long fromMemberId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "to_member_id")
    @Schema(
        description = "to member id",
        example = "12"
    )
    private Member member;

    public Friend(Long fromMemberId) {
        this.fromMemberId = fromMemberId;
    }

}
