package com.leanly.mobile.chat.controller;

import com.leanly.mobile.chat.repository.ChatRoomRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
public class RoomController {

    private final ChatRoomRepository chatRoomRepository;

    // 채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public ModelAndView getRooms() {
        log.info("# 전체 채팅방 목록 조회!!!!");
        ModelAndView mv = new ModelAndView("/test-rooms");

        mv.addObject("list", chatRoomRepository.findAllRooms());

        return mv;
    }

    // 채팅방 개설
    @PostMapping(value = "/room")
    public String createRoom(@RequestParam(name = "name") String name,
        RedirectAttributes redirectAttributes) {
        log.info("# 채팅방 개설!!!! , 채팅방 이름: " + name);

        redirectAttributes.addFlashAttribute(
            "roomName",
            chatRoomRepository.createChatRoomDTO(name)
        );

        return "redirect:/chat/rooms";
    }

    // 채팅방 조회
    @GetMapping("/room")
    public String getRoom(
        @RequestParam(name = "roomId") String roomId,
        @RequestParam(name = "username") String username,
        Model model) {
        log.info("# 특정 채팅방 조회!!!! , 채팅방 고유 값 : " + roomId);

        model.addAttribute("room", chatRoomRepository.findRoomById(roomId));
        model.addAttribute("username", username);

        return "test-room";
    }
}
