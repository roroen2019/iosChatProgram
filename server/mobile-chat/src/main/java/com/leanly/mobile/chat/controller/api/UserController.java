package com.leanly.mobile.chat.controller.api;

import com.leanly.mobile.chat.model.User;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "User", description = "User management APIs")
@RestController
public class UserController {

    @Operation(
        summary = "사용자 이름을 받습니다.",
        description = "유니크한 이름은 아닙니다.",
        tags = {"user", "get"}
    )
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            content = {
                @Content(schema = @Schema(implementation = User.class), mediaType = "application/json")
            }),
        @ApiResponse(
            responseCode = "404",
            content = {
                @Content(schema = @Schema())
            }),
        @ApiResponse(
            responseCode = "500",
            content = {
                @Content(schema = @Schema())
            })
    })
    @Parameter(name = "name", example = "사용자 이름")
    @GetMapping("/v1/kakao")
    public ResponseEntity<User> kakaoUser(
        @RequestParam("name") String name
    ) {
        User user = new User(name, "http://", "hi!!");
        user.changeId(123L);

        return ResponseEntity.ok(user);
    }

    @Operation(
        summary = "사용자 정보를 래핑해 받습니다.",
        description = "이름, 프로필 이미지 경로, 서브메시지가 있습니다.",
        tags = {"user", "post"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = {
                @Content(schema = @Schema(implementation = User.class))
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
    @PostMapping("/v1/apple")
    public ResponseEntity<User> appleUser(
        @RequestBody User user
    ) {
        return ResponseEntity.ok(user);
    }

}
