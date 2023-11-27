//
//  ContentView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            UserListView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("유저")
                }
                .tag(0)
            
            MoreView()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("더보기")
                }
                .tag(1)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
