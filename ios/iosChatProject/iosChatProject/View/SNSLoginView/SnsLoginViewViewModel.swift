//
//  SnsLoginViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import Foundation
//import Combine

class SnsLoginViewViewModel: ObservableObject {
//    private var cancellables: Set<AnyCancellable> = []
    
    @Published var checkKakaoLogin: Bool = false
    @Published var checkAppleLogin: Bool = false
    
    
    // 카카오 로그인
    func kakaoLoginAction(){
        self.checkKakaoLogin = true
    }
    
    // 애플 로그인
    func appleLoginAction(){
        self.checkAppleLogin = true
    }
}
