//
//  ChatViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/05.
//

import Foundation

class ChatViewViewModel : ObservableObject {
    
    @Published var inputChatMessage = ""
    @Published var chatList: [String:AnyObject] = [:]
    
    // 새로운 메세지 받기
    func newChatMessage() {
        SocketIOManager.shared.getChatMessage { messageInfo in
            print("chatMessage 확인:\(messageInfo)")
            DispatchQueue.main.async {
                self.chatList = messageInfo
            }
        }
    }
    
    
    
    
}
