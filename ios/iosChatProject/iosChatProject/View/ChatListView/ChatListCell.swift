//
//  ChatListCell.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import SwiftUI

struct ChatListCell: View {
    var imageUrl: String
    var name: String
    var sub: String
    var time: String
    
    var body: some View {
        VStack {
            HStack {
                // 프로필 이미지
                AsyncImage(url: URL(string: imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Color.red
                }
                .frame(width: 50, height: 50)
                
                VStack {
                    Text(name)
                        .padding(.bottom, 4)
                    Text(sub)
                        .foregroundColor(Color.black.opacity(0.6))
                }
                .padding(.leading, 10)
                
                Spacer()
                
                Text(time)
            }
            Divider()
        }
    }
}

struct ChatListCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatListCell(imageUrl: "", name: "sss", sub: "sss", time: "sss")
    }
}
