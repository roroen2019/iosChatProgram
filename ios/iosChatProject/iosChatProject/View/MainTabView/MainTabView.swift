//
//  MainTabView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import SwiftUI

struct MainTabView: View {
    @Binding var isRoot: Bool
    
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                UserListView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("유저")
                    }
                    .tag(0)
                
                ChatListView()
                    .tabItem {
                        Image(systemName: "bubble.left.fill")
                        Text("채팅")
                    }
                    .tag(1)
                
                MoreView(isRoot: $isRoot)
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("더보기")
                    }
                    .tag(2)
            }
        }
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(isRoot: Binding<Bool>.constant(false))
    }
}
