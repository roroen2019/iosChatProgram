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
    
    
}

struct FriendAddViewModel: Codable {
    let name: String
    let id: Int
}
