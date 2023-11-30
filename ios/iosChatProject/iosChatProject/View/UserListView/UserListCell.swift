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
                Image(systemName: "person.fill")
                    .resizable()
                    
            }
            .frame(width: 50, height: 50)
            .cornerRadius(10)
            
            
            VStack {
                Text(name)
                    .padding(.bottom, 4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(sub)
                    .foregroundColor(Color.black.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading, 10)
            
            
        }
    }
}
