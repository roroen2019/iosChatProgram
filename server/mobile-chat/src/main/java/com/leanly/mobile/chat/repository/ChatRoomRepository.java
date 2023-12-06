package com.leanly.mobile.chat.repository;

import com.leanly.mobile.chat.model.dto.ChatRoomDTO;
import jakarta.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

/*
 * 지금은 간단히 여러 채팅방을 만들어 구현하는 것이 목표
 * 채팅방 정보를 Map Collection을 사용해 관리
 * 실제 서비스 시 DB를 사용해 저장
 * */
@Repository
public class ChatRoomRepository {

    private Map<String, ChatRoomDTO> chatRoomDTOMap;

    @PostConstruct // 해당 어노테이션은 init() 메소드가 객체의 생성 및 초기화가 완료된 후에 호출된다.
    private void init() {
        chatRoomDTOMap = new LinkedHashMap<>();
    }

    public List<ChatRoomDTO> findAllRooms() {
        List<ChatRoomDTO> results = new ArrayList<>(chatRoomDTOMap.values());
        Collections.reverse(results); // 채팅방 생성 순서 최근 순으로 변환

        return results;
    }

    public ChatRoomDTO findRoomById(String id) {
        return chatRoomDTOMap.get(id);
    }

    public ChatRoomDTO createChatRoomDTO(String name) {
        ChatRoomDTO room = ChatRoomDTO.create(name);
        chatRoomDTOMap.put(room.getRoomId(), room);

        return room;
    }
}
