//
//  UserListViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import Foundation

// 테스트용 모델
struct UserListViewModel: Identifiable, Codable {
    var id = UUID()
    
    let userId: Int
    let postId: Int
    let title: String
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        case userId
        case postId = "id" // 서버에서 받는 데이터의 키명
        case title
        case body
    }
}
