//
//  MoreView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//
/*
 더보기 화면
 */
import SwiftUI

struct AlertMessage {
    let title: String
    let message: String
}

struct MoreView: View {
    @ObservedObject private var viewModel = MoreViewViewModel()
    
    // 로그인화면으로 이동하기 위한 변수
    @Binding var isRoot:Bool
    
    @State private var checkLogout = false
    private let alertMessage = AlertMessage(title: "로그아웃", message: "로그아웃 하시겠습니까?")
    
    
    var body: some View {
        NavigationStack {
            List {
                
                Section {
                    NavigationLink {
                        
                    } label: {
                        ProfileListCell(imageUrl: "", name: "이상준", sub: "010-1111-2222")
                    }
                }
                
                Section {
                    
                    Button {
                        self.checkLogout = true
                    } label: {
                        MoreListCell(image: "rectangle.portrait.and.arrow.right", title: "로그아웃", rightInfo: "")
                    }
                        
                }
                
            }
        }
        .alert(alertMessage.title, isPresented: $checkLogout) {
            Button {
                print("로그아웃 확인")
                viewModel.logout()
                self.isRoot = false
                
            } label: {
                Text("확인")
                    .foregroundColor(.red)
            }
            
            Button {
                print("로그아웃 취소")
            } label: {
                Text("취소")
            }

        } message: {
            Text(alertMessage.message)
        }

        
        

    }//body
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView(isRoot: Binding<Bool>.constant(false))
    }
}
