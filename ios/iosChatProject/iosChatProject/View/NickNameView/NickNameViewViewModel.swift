//
//  NickNameViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/04.
//

import Foundation

struct NickNameViewModel : Codable{
    let code: Int
    let message: String
    let userKey: String
}

class NickNameViewViewModel: ObservableObject {
    
    @Published var inputNickName = ""
    @Published var loginComplete = false
    
    func nickNameConfirm(){
        
        // 저장값 가져오기
        let result = LocalDB.shared.dataRead(model: LoginInfo.self)
        
        let platform = result?.first?.platform ?? ""
        let token = result?.first?.token ?? ""
        
        // 토큰값이 빈값이면 false를 리턴
        guard token != "" else {
            return
        }
        
        guard inputNickName != "" else {
            print("닉네임 입력하세요")
            return
        }
        
        
        // 로그인 api
        let url = "signup"
        let parameter: [String:Any] = [
            "snsToken": token,
            "type": platform,
            "nickName": inputNickName
        ]
        print("파라미터 확인:\(parameter)")
        ApiCaller.shared.postData(endUrl: url, parameters: parameter, returnType: NickNameViewModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                print("\(url) success message: \(success)")
                
                let model = LoginInfo()
                model.userKey = success.userKey
                LocalDB.shared.dataSave(model: model) { result in
                    switch result {
                    case .success(_):
                        print("key 저장 성공")
                        self?.loginComplete = true
                    case .failure(_):
                        print("key 저장 실패")
                        self?.loginComplete = false
                    }
                }
                
                
            case .failure(let failure):
                print("\(url) failure message: \(failure)")
                self?.loginComplete = false
            }
        }
    }
}
