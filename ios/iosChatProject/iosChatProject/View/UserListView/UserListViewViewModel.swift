//
//  UserListViewViewModel.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/27.
//

import SwiftUI
import Combine

class UserListViewViewModel: ObservableObject {
    @Published var userList: [UserListViewModel] = []
    var cancellables: Set<AnyCancellable> = []
    
    
    
    
    // Combine을 사용하여 데이터를 가져오는 비동기 메서드
    func fetchData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background)) //subscribe publisher를 background 스레드 사용
            .receive(on: DispatchQueue.main) // UI 업데이트를 메인 스레드에서 수행
            .tryMap { data, response -> Data in
                //예외처리
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                
                return data
            } // 실패, 오류를 발생시키는 map
            .decode(type: [UserListViewModel].self, decoder: JSONDecoder()) //디코딩
            .sink { completion in
                print("completion 확인:\(completion)")
            } receiveValue: { [weak self] returnPost in
                self?.userList = returnPost //약한참조
            }
            .store(in: &cancellables)
    }
    
    // 리스트 오름차순 정렬
    func listAscending() {
        print("오름차순")
    }
    
    // 리스트 내림차순 정렬
    func listDescending() {
        print("내림차순")
    }
    
    
}
