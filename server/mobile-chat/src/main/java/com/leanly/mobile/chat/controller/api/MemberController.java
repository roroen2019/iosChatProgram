package com.leanly.mobile.chat.controller.api;

import com.leanly.mobile.chat.model.dto.MemberDTO;
import com.leanly.mobile.chat.model.entity.Friend;
import com.leanly.mobile.chat.model.entity.Member;
import com.leanly.mobile.chat.model.entity.SnsInfo;
import com.leanly.mobile.chat.service.FriendService;
import com.leanly.mobile.chat.service.MemberService;
import com.leanly.mobile.chat.service.SnsInfoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@Log4j2
@RestController
public class MemberController {

    private final MemberService memberService;
    private final SnsInfoService snsInfoService;
    private final FriendService friendService;

    @Autowired
    public MemberController(
        MemberService memberService,
        SnsInfoService snsInfoService,
        FriendService friendService) {
        this.memberService = memberService;
        this.snsInfoService = snsInfoService;
        this.friendService = friendService;
    }

    @Operation(
        summary = "토큰, 로그인 타입, 닉네임",
        tags = {"POST"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = {
                @Content(schema = @Schema(implementation = MemberDTO.class), mediaType = "application/json")
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
    @PostMapping("/v1/signup")
    public ResponseEntity<Map<String, String>> snsSignUp(
        @RequestBody MemberDTO memberDTO
    ) {
        Member member = new Member(memberDTO.getNickName(), "프로필이미지 경로", "서브 메시지");
        SnsInfo snsInfo = new SnsInfo(memberDTO.getSnsToken(), memberDTO.getType());

        // TODO: 클라이언트 데이터 확인 편하게 하기 위해 급하게 조치
        Map<String, String> result = new HashMap<>();

        Member saveResult = memberService.saveEntity(member);
        if (saveResult == null) {
            result.put("code", String.valueOf(HttpStatus.BAD_REQUEST.value()));
            result.put("userKey", "존재하지 않는 유저");
            return ResponseEntity.badRequest().body(result);
        }

        snsInfoService.saveEntity(snsInfo);
        friendService.saveFromMemberId(new Friend(saveResult.getId()));

        result.put("code", String.valueOf(HttpStatus.OK.value()));
        result.put("userKey", String.valueOf(saveResult.getId()));

        // TODO: Response 라는 공통 응답 클래스에 @Getter 없을 때 Not acceptable 오류 발생
        return ResponseEntity.ok().body(result);
    }


    @Operation(
        summary = "프로필 이미지, 이름, 서브메시지",
        tags = {"GET"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = {
                @Content(schema = @Schema(implementation = Member.class), mediaType = "application/json")
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
    @GetMapping("/v1/search-friend/{id}")
    public ResponseEntity<List<Member>> searchByFriends(
        @PathVariable("id") Long id
    ) {
        List<Member> memberFriends = memberService.getMemberFriends(id);

        if (memberFriends.isEmpty()) {
            return ResponseEntity.badRequest().body(memberFriends);
        }

        // TODO: 유저 친구 리스트 보내 줄 때 Member 필드 값 중 friends 정보만 wrapping 해서 보내자
        // TODO: 응답 데이터의 키 값은 "friends" 를 사용한다.
        return ResponseEntity.ok().body(memberFriends);
    }
}
