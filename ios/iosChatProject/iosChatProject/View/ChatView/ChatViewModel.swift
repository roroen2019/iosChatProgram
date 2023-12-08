//
//  ChatViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/08.
//

import Foundation

struct ChattingListModel: Identifiable {
    var id = UUID()
    
    let roomId: String
    let message: String
    let writer: String
    let stats: Int // 0: 참여했습니다 알림 메세지, 1:일반메세지
    let date: String
}
