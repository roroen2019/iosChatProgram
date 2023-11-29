//
//  ChatView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//
/*
 채팅을 하는곳
 */
import SwiftUI

struct ChatView: View {
    
    var userKey: Int
    
    var body: some View {
        NavigationStack {
            Text("챗뷰")
        }
        .navigationTitle("타이틀")
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(userKey: 0)
    }
}
