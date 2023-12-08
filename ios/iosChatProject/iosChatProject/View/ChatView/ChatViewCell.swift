//
//  ChatViewCell.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/08.
//
/*
 상대방 메세지일때 보여지는 뷰
 */
import SwiftUI

struct ChatViewCell: View {
    
    var profileImage: String
    var writer: String
    var message: String
    var date: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: profileImage)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
            }
            .frame(width: 35, height: 35)
            .cornerRadius(10)
            
            VStack {
                Text(writer)
                HStack {
                    Text(message)
                        .padding()
                        .background(Color.black.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay(alignment: .bottomLeading) {
                            Image(systemName: "arrowtriangle.down.fill")
                                .font(.title)
                                .rotationEffect(.degrees(45))
                                .offset(x:-10,y:10)
                                .foregroundColor(Color.black.opacity(0.4))
                                
                        }
                    Text(date)
                }
                
            }
        }
        
    }
}
