//
//  ChatListViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/07.
//

import Foundation

// MARK: - ChatListViewModelElement
struct ChatListViewModelElement: Identifiable, Codable {
    var id = UUID()
    
    let roomId, name: String

    enum CodingKeys: String, CodingKey {
        case roomId
        case name
    }
}

typealias ChatListViewModel = [ChatListViewModelElement]
