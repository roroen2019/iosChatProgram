//
//  MoreViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/29.
//

import Foundation

class MoreViewViewModel: ObservableObject {
    @Published var isLogout = false
    
    // 로그아웃
    func logout() {
        //로그아웃 api 동작
        
        
        
        //앱 sns로그인 화면으로 이동하기
        self.isLogout = true
    }
}
