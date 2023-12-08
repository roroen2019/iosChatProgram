//
//  FriendAddViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/30.
//

import Foundation
import Combine

class FriendAddViewViewModel: ObservableObject{
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var friendName = ""
    @Published var friendAddAction = false
    
    @Published var alertaction = false
    @Published var alertMessage = ""
    
    
    /// 친구추가 동작
    func friendAdd() {
        
        // 친구추가 api 동작하기
        let parameters:[String:Any] = [
            "":0
        ]
        ApiCaller
            .shared
            .getData(endUrl: "",
                     parameters: parameters,
                     returnType: FriendAddViewModel.self) { result in
                switch result {
                case .success(let success):
                    print("성공:\(success)")

                    self.alertaction = true
                    self.alertMessage = "친구 추가 성공!"
                case .failure(let failure):
                    print("실패:\(failure)")

                    self.alertaction = true
                    self.alertMessage = "api Error 발생!"
                }
            }
    }
    
    
}

struct FriendAddViewModel: Codable {
    let name: String
    let id: Int
}
