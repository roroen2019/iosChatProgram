//
//  UserListView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel = UserListViewViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
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
                            
                            viewModel.friendAddAction = true
                        } label: {
                            Image(systemName: "plus.app")
                                .foregroundColor(Color.black)
                        }
                        .sheet(isPresented: $viewModel.friendAddAction) {
                            // 친구추가화면 띄우기
                            FriendAddView(isDismiss: $viewModel.friendAddAction)
                                
                        }
                        
                        
                        Button {
                            // 검색화면 띄우기
                            withAnimation(.easeIn(duration: 3)) {
                                viewModel.searchAction = true
                            }
                            
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.black)
                        }
                        .fullScreenCover(isPresented: $viewModel.searchAction) {

                            SearchView()

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
                
//                let _ = print("list \(viewModel.userList)")
                // 리스트
                List{
                    ForEach(viewModel.userList) { item in
                        
                        NavigationLink {
                            // 다음 이동할 뷰 설정
                            
                        } label: {
                            UserListCell(imageUrl: item.profileImg, name: item.name, sub: item.subMessage)
                                .frame(height: 40)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .overlay {
                    // 데이터가 없을경우
                    if viewModel.userList.isEmpty {
                        Text("유저목록이 없습니다.\n새로운 유저를 추가해주세요.")
                            .multilineTextAlignment(.center)
                    }
                }
                
            }
            .onAppear {
                viewModel.fetchUserList()
            }
        }
        .navigationBarHidden(true)
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
