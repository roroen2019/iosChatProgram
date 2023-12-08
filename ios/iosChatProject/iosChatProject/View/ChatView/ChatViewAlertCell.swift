//
//  ChatViewAlertCell.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/08.
//

import SwiftUI

struct ChatViewAlertCell: View {
    
    var message:String
    
    var body: some View {
        Text(message)
            .font(.system(size: 10))
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
