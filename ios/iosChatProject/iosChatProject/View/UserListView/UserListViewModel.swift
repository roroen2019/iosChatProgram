//
//  UserListViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import Foundation

//  모델
struct UserListModel: Codable {
    let code: Int
    let message: String
    let data: [Frinds]
}

struct Frinds:Identifiable, Codable {
    var id = UUID()
    
    let userKey: Int
    let name, profileImg, subMessage: String
    
    enum CodingKeys: String, CodingKey {
        case userKey = "id"
        case name, profileImg, subMessage
    }
}



struct testModel: Identifiable, Codable {
    var id = UUID()
    
    let name: String
}
