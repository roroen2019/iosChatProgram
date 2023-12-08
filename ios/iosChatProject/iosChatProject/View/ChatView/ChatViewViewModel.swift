//
//  ChatViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/05.
//

import Foundation

class ChatViewViewModel : ObservableObject {
    
    @Published var inputChatMessage = ""
    @Published var chatList = [[String:AnyObject]]()
    
    func connectToSever(nickName:String) {
        print("소켓연결 시도 + 닉네임:\(nickName)")
        SocketIOManager.shared.connectToServerWithNickname(nickname: nickName) { list in
            self.chatList = list
        }
    }
    
    // 새로운 메세지 받기
    func newChatMessage() {
        SocketIOManager.shared.getChatMessage { messageInfo in
            print("chatMessage 확인:\(messageInfo)")
            DispatchQueue.main.async {
//                self.chatList = messageInfo
            }
        }
    }
    
    // 메세지 보내기
    func sendMessage(message:String, nickName:String) {
        SocketIOManager.shared.sendMessage(message: message, withNickname: nickName)
    }
    
    
}
