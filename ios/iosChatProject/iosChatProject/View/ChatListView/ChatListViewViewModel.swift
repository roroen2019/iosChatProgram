//
//  ChatListViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/05.
//

import Foundation

struct ChatListViewModel: Identifiable {
    let id = UUID()
    
    let name: String
    let userId:Int
}

class ChatListViewViewModel: ObservableObject {
    
    @Published var chatUserList: [ChatListViewModel] = []
    
    func fetchChatUserList() {
        
        let testList = [
            ChatListViewModel(name: "테스트111", userId: 111),
            ChatListViewModel(name: "테스트222", userId: 222),
            ChatListViewModel(name: "테스트333", userId: 333),
            ChatListViewModel(name: "테스트444", userId: 444)
        ]
        
        self.chatUserList = testList
        
        
    }
    
    
}
