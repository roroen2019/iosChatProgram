//
//  CustomLoginButton.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import SwiftUI

struct CustomLoginButton: View {
    
    var image:String
    var name:String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 10)
                
            
            Text(name)
                .font(.title2)
                .foregroundColor(.black)
        }
        
        
    }
}
