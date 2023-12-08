//
//  ChatViewMyCell.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/08.
//
// 내가 입력했을때 보여지는 뷰
import SwiftUI

struct ChatViewMyCell: View {
    
    var date:String
    var message:String
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                Text(date)
                    .font(.system(size: 8))
            }
            
            Text(message)
                .padding()
                .frame(alignment: .trailing)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.title)
                        .rotationEffect(.degrees(315))
                        .offset(x:10,y:10)
                        .foregroundColor(.blue)
                        
                }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        
    }
}
