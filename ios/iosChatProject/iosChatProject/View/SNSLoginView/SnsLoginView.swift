//
//  SnsLoginView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import SwiftUI
import Combine

struct SnsLoginView: View {
    
    @StateObject var viewModel = SnsLoginViewViewModel()

    
    var body: some View {
        ZStack {
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
                        .frame(maxWidth: .infinity, minHeight: 50)
                }
    //            .sheet(isPresented: $viewModel.checkKakaoLogin, content: {
    //                NickNameView()
    //            })
    //            .fullScreenCover(isPresented: $viewModel.checkKakaoLogin,
    //                             content: {
    //                MainTabView(isRoot: $viewModel.checkKakaoLogin)
    //            })
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
                        .frame(maxWidth: .infinity, minHeight: 50)
                }
                .fullScreenCover(isPresented: $viewModel.checkAppleLogin, content: {
                    MainTabView(isRoot: $viewModel.checkAppleLogin)
                })
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 2)
                )
            }
            .padding()
            
            let _ = print("asdf111: \(viewModel.checkKakaoLogin)")
            // 카카오 로그인이 되면 닉네임 화면을 보여주기
            if viewModel.checkKakaoLogin {
                NickNameView(isDismiss: $viewModel.nickNameViewDisMiss)
                let _ = print("asdf222: \(viewModel.checkKakaoLogin)")
                // 닉네임 화면에서 확인버튼을 누르면 dismiss되고, 메인탭으로 이동하기
                if !viewModel.nickNameViewDisMiss {
                    MainTabView(isRoot: $viewModel.nickNameViewDisMiss)
                }
            }
        }
        
        
        
    }//body
    
    
    func kakaoLogin() {
        
    }
}

struct SnsLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SnsLoginView()
    }
}
