//
//  SnsLoginViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import Foundation
import KakaoSDKUser
//import Combine

class SnsLoginViewViewModel: ObservableObject {
//    private var cancellables: Set<AnyCancellable> = []
    
    @Published var checkKakaoLogin: Bool = false
    @Published var checkAppleLogin: Bool = false
    
    
    // 카카오 로그인
    func kakaoLoginAction(){
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
                    self.checkKakaoLogin = true
                }
            }
        } else { //카카오 계정으로 로그인
            print("카카오톡 앱 없음")
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                
                guard error == nil else {
                    print("웹페이지 로그인 에러:\(String(describing: error))")
                    return
                }
                
                print("카카오 토큰:\(String(describing: oauthToken))")
                let token = oauthToken?.accessToken ?? ""
                
                // 토큰 저장
                guard token != "" else { return }
                // realm
                let login = LoginInfo()
                login.platform = "kakao"
                login.token = token
                LocalDB.shared.dataSave(model: login) { result in
                    switch result {
                    case .success(_):
                        self.checkKakaoLogin = true
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
