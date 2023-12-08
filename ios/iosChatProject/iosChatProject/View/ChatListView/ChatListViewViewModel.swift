//
//  ChatListViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/05.
//

import Foundation

class ChatListViewViewModel: ObservableObject {
    
    @Published var chatUserList = ChatListViewModel()
    
    func fetchChatRoomList() {
        
        
        let endUrl = "chat/rooms"
        ApiCaller.shared.getData(endUrl: endUrl, parameters: nil, returnType: ChatListViewModel.self) { result in
            switch result {
            case .success(let success):
                print("성공")
                DispatchQueue.main.async {
                    self.chatUserList = success
                }
            case .failure(let failure):
                print("실패")
                print("API - \(endUrl) Error: \(failure)")
            }
        }
    }
    
    
}
