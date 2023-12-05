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
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var friendAddAction = false //친구찾기 버튼
    @Published var searchAction = false //검색버튼
    
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
    
    // 친구리스트 요청
    func fetchUserList() {
        
        let endUrl = "kakao"
        let parameters: [String:Any] = [
            "name":"sss"
        ]
        
        // 서버에서 리스트가 변동사항이 있다고 알려주면 동작
        if Common.changeUserListBool {
            
//            let result = ApiCaller.shared.getData(endUrl: endUrl, parameters: parameters, returnType: UserListViewModel.self)
//
//            result.sink { completion in
//                print("completion 확인:\(completion)")
//            } receiveValue: { [weak self] resultData in
//                self?.userList = [resultData]
//            }
//            .store(in: &cancellables)
            
            // 밑의코드를 실행시키지 않기위해 return 사용, 밑에는 앱 최초 한번 실행시에만 동작
            return
        }
        
        // 테스트
        ApiCaller.shared.getData(endUrl: endUrl, parameters: parameters, returnType: testModel.self) { result in
            switch result {
            case .success(let success):
                print("success:\(success)")
            case .failure(let failure):
                print("\(endUrl): \(failure)")
            }
        }
        
        
//        // 앱이 처음 한번 실행했을경우
//        let count = checkStartingApp() // 1 or 2
//
//        if count == 1 {
//            let result = ApiCaller.shared.getData(endUrl: endUrl, parameters: parameters, returnType: UserListViewModel.self)
//
//            result.sink { completion in
//                print("completion 확인:\(completion)")
//            } receiveValue: { [weak self] resultData in
//                self?.userList = [resultData]
//            }
//            .store(in: &cancellables)
//        }
        
        
        
    }
    
    
    // 리스트 오름차순 정렬
    func listAscending() {
        print("오름차순")
    }
    
    // 리스트 내림차순 정렬
    func listDescending() {
        print("내림차순")
    }
    
    // 앱이 처음 한번 실행했을경우
    func checkStartingApp() -> Int?{
        // 값이 있는지 확인, 없으면 처음, 있으면 2번째 실행
        let result = LocalDB.shared.dataRead(model: FirstStartApp.self)
        if result == nil {
            // 처음
            let first = FirstStartApp()
            first.startValue = true
            LocalDB.shared.dataSave(model: first) { result in
                switch result {
                case .success(_):
                    ()
                case .failure(_):
                    ()
                }
            }
            return 1
        } else {
            // 두번쩨
            return 2
        }
    }
    
}
