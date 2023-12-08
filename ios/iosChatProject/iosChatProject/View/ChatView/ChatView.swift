//
//  ChatView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//
/*
 채팅을 하는곳(1:1채팅을 하는곳)
 */
import SwiftUI

struct ChatView: View {
    var nickName: String
    var roomId: String
    
    @StateObject var viewModel = ChatViewViewModel()
    
    
    // 유저 연결됬을때
    let userConnectedPublisher = NotificationCenter.default.publisher(for: NSNotification.Name(rawValue: "userConnected"))
    // 유저 연결 끊어졌을때
    let userDisConnectedPublisher = NotificationCenter.default.publisher(for: NSNotification.Name(rawValue: "userDisConnected"))
    // 유저 타이핑 할때
    let userTypingPublisher = NotificationCenter.default.publisher(for: NSNotification.Name(rawValue: "userTyping"))
    
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
//                    ForEach(viewModel.chatList) { item in
//                        Text(item)
//                    }
                }
                .listStyle(PlainListStyle())
                
                
                VStack {
                    HStack {
                        TextField("내용을 입력하세요.", text: $viewModel.inputChatMessage)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        Button {
                            viewModel.sendMessage(message: viewModel.inputChatMessage, nickName: self.nickName)
                        } label: {
                            Text("전송")
                                
                        }

                    }
                    
                }
                .frame(height: 50)
                .background(Color.white)
                
            }
            .padding()
        }
        .onAppear {
            print("chatView onAppear")
            viewModel.connectToSever(nickName: self.nickName)
            viewModel.newChatMessage()
            
        }
        .navigationTitle(nickName)
        .onReceive(userConnectedPublisher) { _ in
            print("유저연결")
        }
        .onReceive(userDisConnectedPublisher) { _ in
            print("유저연결종료")
        }
        .onReceive(userTypingPublisher) { _ in
            print("유저타이핑중")
        }
        
        
        
    }//body
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(nickName: "", roomId: "")
    }
}
