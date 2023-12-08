package com.leanly.mobile.chat.controller.api;

import com.leanly.mobile.chat.model.dto.FriendAddDTO;
import com.leanly.mobile.chat.model.dto.FriendDTO;
import com.leanly.mobile.chat.service.FriendService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Log4j2
@RestController
public class FriendController {

    private final FriendService friendService;

    public FriendController(
        FriendService friendService) {
        this.friendService = friendService;
    }

    @Operation(
        summary = "유저 고유 키, 추가할 친구 고유 키",
        tags = {"POST"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = {
                @Content(schema = @Schema(implementation = FriendDTO.class), mediaType = "application/json")
            }),
        @ApiResponse(
            responseCode = "400",
            description = "BAD REQUEST",
            content = {
                @Content(schema = @Schema())
            }),
        @ApiResponse(
            responseCode = "404",
            description = "NOT FOUND",
            content = {
                @Content(schema = @Schema())
            }),
        @ApiResponse(
            responseCode = "500",
            description = "INTERNAL SEVER ERROR",
            content = {
                @Content(schema = @Schema())
            })
    })
    @PostMapping("/v1/add-friend/")
    public ResponseEntity<FriendDTO> addMemberOfFriends(
        @RequestBody FriendAddDTO friendAddDTO
    ) {
        log.info(
            "내가 친구 추가 요청한 당사자: " + friendAddDTO.getFrom_member_id()
                + "\n내가 친구 요청 당하는 사용자: " + friendAddDTO.getTo_member_id()
        );

        // TODO: 객체 간의 서로 참조로 인한 무한 루프
        // TODO: Infinite recursion (StackOverflowError)
        FriendDTO friend = friendService.addFriendToMember(friendAddDTO);

        return ResponseEntity.ok().body(friend);
    }

}
