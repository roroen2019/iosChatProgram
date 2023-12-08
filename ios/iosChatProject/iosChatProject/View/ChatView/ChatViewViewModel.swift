//
//  ChatViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/05.
//

import Foundation
import StompClientLib

class ChatViewViewModel : ObservableObject {
    
    var roomId = ""
    @Published var myNickName = ""
    @Published var inputChatMessage = ""
    @Published var chatList = [ChattingListModel]()
    @Published var lastMessageId = 0
    
    // 닉네임 localdb에서 가져오기
    func setNickName() {
        let result = LocalDB.shared.dataRead(model: LoginInfo.self)
        self.myNickName = result?.first?.nickName ?? ""
    }
    
    // localdb에 채팅기록 저장하기
    func saveChatList() {
        print("채팅 저장")
        // realm의 저장된 값중 chatListSave의 모델을 가져온다.
        let chatSaveModel = LocalDB.shared.dataRead(model: ChatListSave.self)
        print("채팅기록 확인:\(chatSaveModel)")
        // 만약 없으면 새로 만든다
        if chatSaveModel == nil {
            
            // 채팅기록만큼 for문 돌려서 저장하기
            for index in self.chatList {
                
                let chatListSaveModel = ChatListSave()
                chatListSaveModel.roomId = index.roomId
                chatListSaveModel.stats = index.stats
                chatListSaveModel.writer = index.writer
                chatListSaveModel.message = index.message
                chatListSaveModel.date = index.date

                LocalDB.shared.dataSave(model: chatListSaveModel) { result in
                    switch result {
                    case .success(_):
                        print("저장 성공")
                    case .failure(_):
                        print("저장 실패")
                    }
                }
            }
            
        } else {
            // 만약 있으면 해당 채팅방의 id값을 이용해서 찾는다.
            let nowRoomChatList = chatSaveModel?.filter {
                $0.roomId == self.roomId
            }
            
            print("저장된 채팅리스트 확인:\(nowRoomChatList)")
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    // stomp
    // Socket Client instance
    private var socketClient = StompClientLib()
    
    // Socket Connection URL
    // http://54.180.77.161/stomp/chat
    private let url = URL(string: "ws://54.180.77.161/stomp/chat/websocket")!
    
    // Socket Connection
    func registerSockect() {
        socketClient.openSocketWithURLRequest(
            request: NSURLRequest(url: url),
            delegate: self
            //            connectionHeaders: [ "X-AUTH-TOKEN" : accessToken ]
        )
    }
    
    // Stomp 클라이언트가 특정 Topic (Destination)을 구독하는 함수 입니다.
    // socketClient.subscribe(destination: "/sub/chat/room/"  + chatId)
    func subscribe() {
        let destination = "/sub/chat/room/" + roomId
        print("destination 확인:\(destination)")
        socketClient.subscribe(destination: destination)
    }
    
    // 채팅방 입장 신호 보내기
    // Publish Message
    // toDestination: "/pub/chat/message
    func enterChatRoom() {
        print("enterChatRoom 동작")
//        let dto = StompSendDTO(message: "안녕")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            var payloadObject = Dictionary<String, Any>()
            payloadObject["roomId"] = self.roomId
            payloadObject["writer"] = self.myNickName
            payloadObject["message"] = ""
            
            self.socketClient.sendJSONForDict(
                dict: payloadObject as AnyObject,
                toDestination: "/pub/chat/enter")
        }
        
    }
    
    // 메세지 보내기
    func sendMessage() {
        print("send message 동작")
        
        var payloadObject = Dictionary<String, Any>()
        payloadObject["roomId"] = self.roomId
        payloadObject["writer"] = self.myNickName
        payloadObject["message"] = self.inputChatMessage
        
        socketClient.sendJSONForDict(
            dict: payloadObject as AnyObject,
            toDestination: "/pub/chat/message")
        
        // 입력값 초기화
        self.inputChatMessage = ""
    }
    
    
    // Unsubscribe
    func disconnect() {
        socketClient.disconnect()
    }
}

extension ChatViewViewModel: StompClientLibDelegate {
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
//        print("jsonBody 확인:\(jsonBody)")
        guard let JSON = jsonBody as? [String : AnyObject] else { return }
        print("jsonBody 확인:\(JSON)")
        guard let jsonMessage = JSON ["message"] as? String else {return}
        guard let jsonWriter = JSON ["writer"] as? String else {return}
        guard let jsonStats = JSON ["stats"] as? Int else {return}
        guard let jsonRoomId = JSON ["roomId"] as? String else {return}
        
//        print("message:\(jsonMessage)")
//        print("writer:\(jsonWriter)")
        
        // 시간
        let nowDate = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "a hh시 mm분"
        dateFormater.locale = Locale(identifier:"ko_KR")
        let nowDateTime = dateFormater.string(from: nowDate)
        
        // 메세지
        let newMessage = ChattingListModel(roomId: jsonRoomId, message: jsonMessage, writer: jsonWriter, stats: jsonStats, date: nowDateTime)
        
        chatList.append(newMessage)
    }
    
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("Stomp socket is disconnected")
    }
    
    func stompClientDidConnect(client: StompClientLib!) {
        print("Stomp socket is connected")
        subscribe()
    }
    
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
        print("Receipt : \(receiptId)")
    }
    
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("Error send : " + description)
        
        socketClient.disconnect()
        registerSockect()
    }
    
    func serverDidSendPing() {
        print("Server ping")
    }
    
    
}
