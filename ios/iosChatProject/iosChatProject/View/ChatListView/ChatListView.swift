//
//  ChatListView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//
/*
 채팅 기록 리스트 뷰
 */
import SwiftUI

struct ChatListView: View {
    
    @ObservedObject private var viewModel = ChatListViewViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.chatUserList) { item in
                    NavigationLink {
                        ChatView(nickName: item.name, userKey: item.userId)
                    } label: {
                        ChatListCell(imageUrl: "", name: item.name, sub: "", time: "22d")
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .environment(\.defaultMinListRowHeight, 50)

        }
        .onAppear {
            viewModel.fetchChatUserList()
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
