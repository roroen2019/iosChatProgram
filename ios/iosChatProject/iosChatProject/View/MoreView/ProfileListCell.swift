//
//  ProfileListCell.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//
/*
 더보기 리스트 프로필 셀
 */
import SwiftUI

struct ProfileListCell: View {
    
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
            
            VStack(alignment: .center) {
                Text(name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(sub)
                    .foregroundColor(Color.black.opacity(0.6))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
            }
            .padding(.leading, 10)
            
            
        }
    }
}
