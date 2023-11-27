//
//  UserListCell.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import SwiftUI

struct UserListCell: View {
    var imageUrl: String
    var name: String
    var sub: String
    
    var body: some View {
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
            }
            .padding(.leading, 10)
            
            
        }
    }
}
