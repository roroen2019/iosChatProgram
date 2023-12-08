package com.leanly.mobile.chat.controller.chat;

import com.leanly.mobile.chat.model.dto.ChatMessageDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
@Log4j2
public class StompChatController {

    private final SimpMessagingTemplate template; // 특정 Broker로 메시지를 전달

    /*Client가 SEND할 수 있는 경로
    stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    "/pub/chat/enter"*/
    @MessageMapping(value = "/chat/enter")
    public void clientEnter(
        ChatMessageDTO messageDTO
    ) {
        log.info("/pub/chat/enter 매핑되었습니다!!!!!"
            + "\n/pub/chat/enter writer: " + messageDTO.getWriter()
            + "\n/pub/chat/enter roodId: " + messageDTO.getRoomId());

        messageDTO.setMessage(messageDTO.getWriter() + "님이 채팅방에 참여하였습니다.");
        messageDTO.setStats(0);
        template.convertAndSend("/sub/chat/room/" + messageDTO.getRoomId(), messageDTO);
    }

    @MessageMapping(value = "/chat/message")
    public void clientMessage(
        ChatMessageDTO messageDTO
    ) {
        log.info("/pub/chat/message 매핑되었습니다!!!!!"
            + "\n/pub/chat/message roomId: " + messageDTO.getRoomId());
        messageDTO.setStats(1);
        template.convertAndSend("/sub/chat/room/" + messageDTO.getRoomId(), messageDTO);
    }
}
