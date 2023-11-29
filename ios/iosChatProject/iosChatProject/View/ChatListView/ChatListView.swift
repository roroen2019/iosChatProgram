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
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10, id: \.self) { num in
                    ChatListCell(imageUrl: "", name: "aaa", sub: "12", time: "22d")
                        
                        .listRowSeparator(.hidden)
                        
                }
            }
            .listStyle(PlainListStyle())
            .environment(\.defaultMinListRowHeight, 50)

            
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
