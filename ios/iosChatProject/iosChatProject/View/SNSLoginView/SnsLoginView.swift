//
//  SnsLoginView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import SwiftUI

struct SnsLoginView: View {
    
    @ObservedObject var viewModel = SnsLoginViewViewModel()
    
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.bottom, 100)
            
            // kakao 로그인
            Button {
                print("kakao login 동작")
                viewModel.kakaoLoginAction()
                
            } label: {
                CustomLoginButton(image: "kakao", name: "카카오 로그인")
            }
            .fullScreenCover(isPresented: $viewModel.checkKakaoLogin, content: {
                MainTabView(isRoot: $viewModel.checkKakaoLogin)
            })
            .frame(width: 200, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 2)
            )
            
            
            // apple 로그인
            Button {
                print("apple login 동작")
                viewModel.appleLoginAction()
                
            } label: {
                CustomLoginButton(image: "apple", name: "애플 로그인")
            }
            .fullScreenCover(isPresented: $viewModel.checkAppleLogin, content: {
                MainTabView(isRoot: $viewModel.checkAppleLogin)
            })
            .frame(width: 200, height: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 2)
            )
        }
        .onAppear {
            print("snsLoginView onAppear")
        }
        
    }//body
}

struct SnsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SnsLoginView()
    }
}
