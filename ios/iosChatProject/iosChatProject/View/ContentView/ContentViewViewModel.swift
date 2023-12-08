//
//  ContentViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/01.
//

import Foundation


class ContentViewViewModel : ObservableObject {
    
    // 로그인 확인
    @Published var checkLogin = false
    
    func checkUserData() {
        let result = LocalDB.shared.dataRead(model: LoginInfo.self)
        guard result != nil else { return }
//        print("로그인정보:\(result?.count)")
        self.checkLogin = true
        
    }
}
