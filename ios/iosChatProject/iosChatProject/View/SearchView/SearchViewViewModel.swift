//
//  SearchViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/30.
//

import Foundation

struct SearchViewModel: Identifiable {
    var id = UUID()
    
    let profileImage: String
    let name: String
    let sub: String
}

class SearchViewViewModel: ObservableObject {
    
    @Published var searchList: [SearchViewModel] = []
    @Published var searchWord: String = ""
    
    func fetchSearchList(search:String) {
        
    }
    
}
