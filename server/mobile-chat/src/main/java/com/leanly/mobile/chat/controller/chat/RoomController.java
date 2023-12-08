package com.leanly.mobile.chat.controller.chat;

import com.leanly.mobile.chat.model.dto.ChatRoomDTO;
import com.leanly.mobile.chat.repository.ChatRoomRepository;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Log4j2
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
public class RoomController {

    private final ChatRoomRepository chatRoomRepository;

    @Operation(
        summary = "전체 채팅방 목록 조회",
        tags = {"GET"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = {
                @Content(schema = @Schema(implementation = ChatRoomDTO.class, type = "array"), mediaType = "application/json")
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
    // 채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public List<ChatRoomDTO> getRooms() {
        log.info("# 전체 채팅방 목록 조회!!!!");

        List<ChatRoomDTO> chatRoomDTOS = chatRoomRepository.findAllRooms();

        if (chatRoomDTOS.isEmpty()) {
            Map<String, ChatRoomDTO> chatRoomDTOMap = new LinkedHashMap<>();
            ChatRoomDTO room = new ChatRoomDTO("", "");
            chatRoomDTOMap.put(room.getRoomId(), room);
            List<ChatRoomDTO> results = new ArrayList<>(chatRoomDTOMap.values());
            Collections.reverse(results); // 채팅방 생성 순서 최근 순으로 변환

            return results;
        }

        return chatRoomDTOS;
    }


    @Operation(
        summary = "채팅방 생성",
        tags = {"POST"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = {
                @Content(schema = @Schema(implementation = ChatRoomDTO.class), mediaType = "application/json")
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
    // 채팅방 개설
    @PostMapping(value = "/room")
    public ChatRoomDTO createRoom(@RequestParam(name = "name") String name) {
        log.info("# 채팅방 개설!!!! , 채팅방 이름: " + name);

        return chatRoomRepository.createChatRoomDTO(name);
    }


    @Operation(
        summary = "채팅방 조회",
        tags = {"GET"})
    @ApiResponses({
        @ApiResponse(
            responseCode = "200",
            description = "OK",
            content = {
                @Content(schema = @Schema(implementation = ChatRoomDTO.class), mediaType = "application/json")
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
    // 채팅방 조회
    @GetMapping("/room")
    public ChatRoomDTO getRoom(
        @RequestParam(name = "roomId") String roomId
    ) {
        log.info("# 특정 채팅방 조회!!!! , 채팅방 고유 값 : " + roomId);

        return chatRoomRepository.findRoomById(roomId);
    }
}
