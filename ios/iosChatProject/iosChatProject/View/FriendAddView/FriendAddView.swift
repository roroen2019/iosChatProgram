//
//  FriendAddView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/30.
//

import SwiftUI

struct FriendAddView: View {
    @Binding var isDismiss:Bool
    
    @ObservedObject private var viewModel = FriendAddViewViewModel()
    
    var body: some View {
        VStack {
            TextField("친구 이름을 입력하세요", text: $viewModel.friendName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // 여기에서 친구 추가 로직을 처리합니다.
                // friendName 변수에 입력된 값이 있습니다.
                // 추가 로직을 여기에 구현하세요.
                print("친구 추가: \($viewModel.friendName)")
                viewModel.friendAdd()
                
                
            }) {
                Text("친구 추가")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .alert("알림", isPresented: $viewModel.alertaction)
            {
                Button {
                    print("확인")
                    self.isDismiss = false //창닫기
                } label: {
                    Text("확인")
                }
            } message: {
                Text(viewModel.alertMessage)
            }
            
        }
        .padding()
    }
}

struct FriendAddView_Previews: PreviewProvider {
    static var previews: some View {
        FriendAddView(isDismiss: Binding<Bool>.constant(false))
    }
}
