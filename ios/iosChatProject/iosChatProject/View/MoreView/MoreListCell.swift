//
//  MoreListCell.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import SwiftUI

struct MoreListCell: View {
    
    var image: String
    var title: String
    var rightInfo: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .padding(.trailing, 4)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.black)
            
            Text(rightInfo)
                .foregroundColor(.black)
                .padding(.trailing, 0)
            
            
        }
    }
}
