//
//  NickNameView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/04.
//

import SwiftUI

struct NickNameView: View {
    
    @Binding var isDismiss: Bool
    @StateObject private var viewModel = NickNameViewViewModel()
    
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                TextField("닉네임을 입력하세요.", text: $viewModel.inputNickName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    print("닉네임 확인:\(viewModel.inputNickName)")
                    // 로그인 완료되면 dismiss 한뒤 특정뷰로 이동
                    viewModel.nickNameConfirm()
                } label: {
                    Text("확인")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                
                
            }
            .padding()
            
        }
        .onAppear{
            print("NickNameView onAppear")
        }
        .onChange(of: viewModel.loginComplete) { newValue in
            if newValue {
                self.isDismiss.toggle()
            }
        }
        
        
        
        
    }//body
}

struct NickNameView_Previews: PreviewProvider {
    static var previews: some View {
        NickNameView(isDismiss: Binding<Bool>.constant(false))
    }
}
