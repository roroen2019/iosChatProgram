//
//  SnsLoginViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import Foundation
import KakaoSDKUser


class SnsLoginViewViewModel: ObservableObject {
    
    @Published var checkKakaoLogin = false
    @Published var checkAppleLogin = false
    
    @Published var nickNameViewDisMiss = false
    
    
    // 카카오 로그인
    func kakaoLoginAction(){
//        self.checkKakaoLogin = true
//        self.nickNameViewDisMiss = true
        
        
        
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
//                    self.checkKakaoLogin = true
                }
            }
        } else { //카카오 계정으로 로그인
            print("카카오톡 앱 없음")
            
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in

                guard error == nil else {
                    //print("웹페이지 로그인 에러:\(String(describing: error))")
                    print("웹페이지 로그인 에러")
                    return
                }

                //print("카카오 토큰:\(String(describing: oauthToken))")

                guard let token = oauthToken?.accessToken else {
                    print("카카오 토큰이 없다!")
                    return
                }

                print("로그인정보 저장 시작")
                // realm
                let login = LoginInfo()
                login.platform = "kakao"
                login.token = token
                login.userKey = ""
                LocalDB.shared.dataSave(model: login) { result in
                    switch result {
                    case .success(_):

                        self.checkKakaoLogin = true
                        self.nickNameViewDisMiss = true
                        print("asdf 로그인정보 저장 성공\(self.checkKakaoLogin)")


                    case .failure(_):
                        print("로그인정보 저장 실패")
                    }
                }
            }
        }
        
        
    }
    
    // 애플 로그인
    func appleLoginAction(){
        self.checkAppleLogin = true
    }
}
