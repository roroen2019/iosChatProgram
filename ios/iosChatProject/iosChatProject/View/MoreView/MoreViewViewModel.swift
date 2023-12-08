//
//  MoreViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import Foundation
import KakaoSDKUser

class MoreViewViewModel: ObservableObject {
    @Published var isLogout = false
    
    // 로그아웃
    func logout() {
        //로그아웃 api 동작
        
        
        // 카카오 로그아웃
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
        
        // 로컬db 초기화
        LocalDB.shared.dataDelete { error in
            if let error = error {
                print(error)
            }
            else {
                print("dataDelete success.")
            }
            
        }
        
        
        
        //앱 sns로그인 화면으로 이동하기
        self.isLogout = true
    }
}
