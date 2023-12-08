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
                .frame(width: 45, height: 45)
                .cornerRadius(10)
                
                VStack {
                    Text(name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(sub)
                        .font(.system(size: 14))
                        .foregroundColor(Color.black.opacity(0.6))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.leading, 10)
                
                Spacer()
                
                Text(time)
            }
        }
    }
}

struct ChatListCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatListCell(imageUrl: "", name: "sss", sub: "ssasass", time: "sss")
    }
}
