//
//  UserListView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel = UserListViewViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                // 상단
                HStack {
                    Text("유저")
                        .font(.title)
                    
                    Spacer(minLength: 0)
                    
                    HStack {
                        Button {
                            // 검색화면 띄우기
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.black)
                        }
                        
                        Menu {
                            Button("오름차순 정렬", action: viewModel.listAscending)
                            Button("내림차순 정렬", action: viewModel.listDescending)
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.black)
                        }

                    }
                }
                .padding(.horizontal, 20)
                
                // 리스트
                List{
                    ForEach(viewModel.userList) { item in
                        
                        NavigationLink {
                            // 다음 이동할 뷰 설정
                            ChatView(userKey: item.postId)
                        } label: {
                            UserListCell(imageUrl: "", name: item.title, sub: String(item.postId))
                                .frame(height: 40)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                
            }
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
