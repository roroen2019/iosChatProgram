//
//  CustomTab.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import SwiftUI

struct CustomTab: View {
    
    @State var index: Int
    
    var body: some View {
        HStack {
            
            Spacer(minLength: 0)
            
            Button {
                self.index = 0
                print("버튼 탭:\(self.index)")
            } label: {
                VStack {
                    Image(systemName: "person.fill")
                    Text("유저")
                }
            }
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1: 0.3))
            
            Spacer(minLength: 0)
            
            Button {
                self.index = 1
                print("버튼 탭:\(self.index)")
            } label: {
                VStack {
                    Image(systemName: "ellipsis")
                    
                    Text("더보기")
                }
            }
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1: 0.3))
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 30) //좌우 패딩설정
        .background(Color.white)
        
    }
}
