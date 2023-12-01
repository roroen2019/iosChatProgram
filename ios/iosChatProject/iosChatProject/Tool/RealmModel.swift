//
//  RealmModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/01.
//

import Foundation
import RealmSwift

// realm 모델 생성
class LoginInfo: Object {
    @Persisted var platform: String
    @Persisted var token: String
    
}

class FirstStartApp: Object {
    @Persisted var startValue: Bool //false: 아니오, true: 네
    
    
}
