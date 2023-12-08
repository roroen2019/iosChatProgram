//
//  SearchView.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/30.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var searchWord = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        
                        TextField("검색", text: $searchWord)
                            
                            
                    }
                    .frame(height: 40)
                    .background(Color.gray.opacity(0.6))
                    .cornerRadius(5)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    
                    Button {
                        print("취소액션")
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("취소")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                    .padding()
                }
                
                
                
                if self.searchWord != "" {
                    List {
                        ForEach(0..<3) { item in
                            ChatListCell(imageUrl: "", name: "ttt", sub: "tttt", time: "ee")
                        }
                    }
                    
                } else {
                    Spacer(minLength: 0)
                }
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
