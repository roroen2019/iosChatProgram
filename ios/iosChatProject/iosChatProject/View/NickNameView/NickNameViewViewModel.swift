//
//  NickNameViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/04.
//

import Foundation

struct NickNameViewModel : Codable{
    let code: String
    let userKey: String
}

class NickNameViewViewModel: ObservableObject {
    
    @Published var inputNickName = ""
    @Published var loginComplete = false
    
    //MARK: 닉네임 확인하기
    func nickNameConfirm(){
        
        // 저장값 가져오기
        let localData = LocalDB.shared.dataRead(model: LoginInfo.self)
        
        let platform = localData?.first?.platform ?? ""
        let token = localData?.first?.token ?? ""
        
        // 토큰값이 빈값이면 false를 리턴
        guard token != "" else {
            return
        }
        
        guard inputNickName != "" else {
            print("닉네임 입력하세요")
            return
        }
        
        // 로그인 api
        let url = "v1/signup"
        let parameter: [String:Any] = [
            "snsToken": token,
            "type": platform,
            "nickName": inputNickName
        ]
        print("파라미터 확인:\(parameter)")
        ApiCaller.shared.postData(endUrl: url, parameters: parameter, returnType: NickNameViewModel.self) { [weak self] result in
            switch result {
            case .success(let success):
                print("\(url) success")
                
                let selectModel = localData?.first
                
                LocalDB.shared.dataUpdate(model: selectModel!, key: "nickName", value: self?.inputNickName ?? "") { error in
                    
                    if let error = error {
                        print(error)
                        print("닉네임 업데이트 실패")
                        
                    }
                    else {
                        print("닉네임 업데이트 성공")
                        
                    }
                }
                
                
                // 기존 유저정보 업데이트하기
                LocalDB.shared.dataUpdate(model: selectModel!, key: "userKey", value: success.userKey) { error in
                    
                    if let error = error {
                        print(error)
                        print("key 업데이트 실패")
                        self?.loginComplete = false
                    }
                    else {
                        print("key 업데이트 성공")
                        self?.loginComplete = true
                    }
                }
                
                
                
                
                
            case .failure(let failure):
                print("\(url) failure message: \(failure)")
                self?.loginComplete = false
            }
        }
    }
}
