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
    @Persisted var userKey: String
    @Persisted var nickName: String
}

class FirstStartApp: Object {
    @Persisted var startValue: Bool //false: 아니오, true: 네
}

// 채팅기록 저장용
class ChatListSave: Object {
    @Persisted var roomId: String
    @Persisted var stats: Int
    @Persisted var writer: String
    @Persisted var message: String
    @Persisted var date: String
}
