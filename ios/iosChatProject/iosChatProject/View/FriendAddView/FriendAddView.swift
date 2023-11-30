//
//  FriendAddView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/30.
//

import SwiftUI

struct FriendAddView: View {
    @Binding var isDismiss:Bool
    
    @State private var friendName: String = ""
    @State private var alertaction = false
    @State private var alertMessage = "알림메세지"
    
    var body: some View {
        VStack {
            TextField("친구 이름을 입력하세요", text: $friendName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
                // 여기에서 친구 추가 로직을 처리합니다.
                // friendName 변수에 입력된 값이 있습니다.
                // 추가 로직을 여기에 구현하세요.
                print("친구 추가: \(friendName)")
                
                // 친구추가 api 동작하기
//                let parameters:[String:Any] = [
//                    "":0
//                ]
//                ApiCaller
//                    .shared
//                    .getData(endUrl: "",
//                             parameters: parameters,
//                             returnType: FriendAddViewModel.self) { result in
//                        switch result {
//                        case .success(let success):
//                            print("성공:\(success)")
//
//                            self.alertaction = true
//                            self.alertMessage = "친구 추가 성공!"
//                        case .failure(let failure):
//                            print("실패:\(failure)")
//
//                            self.alertaction = true
//                            self.alertMessage = "api Error 발생!"
//                        }
//                    }
                
                //테스트
                self.alertaction = true
                
                
            }) {
                Text("친구 추가")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            .alert("알림", isPresented: $alertaction) {
                        Button {
                            print("확인")
                            self.isDismiss = false //창닫기
                        } label: {
                            Text("확인")
                        }
                    } message: {
                        Text(self.alertMessage)
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
