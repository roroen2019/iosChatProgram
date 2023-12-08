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
                        ChatView(nickName: item.name, roomId: item.roomId)
                    } label: {
                        ChatListCell(imageUrl: "", name: item.name, sub: "sub", time: "22d")
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .environment(\.defaultMinListRowHeight, 50)
            .overlay {
                // 데이터가 없을경우
                if viewModel.chatUserList.isEmpty {
                    Text("채팅기록이 없습니다.")
                        .multilineTextAlignment(.center)
                }
            }

        }
        .onAppear {
            viewModel.fetchChatRoomList()
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
