//
//  ApiCaller.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/30.
//

import Foundation
import Alamofire

// 에러 커스텀 정의하기
enum APIError: Error { //LocalizedError
    case invalidURL
    case invalidResponse
    case invalidData
    case faildDecode
}


final class ApiCaller: NSObject {
    static let shared = ApiCaller()
    private let baseUrl = ""
    
    private override init() {}
    
    /// get method 통신을 사용
    func getData<T:Codable>(endUrl:String, parameters: [String:Any]?, returnType: T.Type, completion: @escaping (Result<T, APIError>) -> Void ) {
        
        let url = baseUrl + endUrl
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).response { response in
            // 헤더 확인
//            let header = response.response
//                myLogPrint("리퀘스트 확인:\(response.request)")
//            let statusCode = header?.statusCode ?? 0
            
            switch response.result {
            case .success(let data):
                
                // 디코드
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                guard let result = try? decoder.decode(returnType.self, from: data!) else {
                    completion(.failure(.faildDecode))
                    return
                }
                
                completion(.success(result))
                
                break
            case .failure(_):
                completion(.failure(.invalidResponse))
                break
            }
        }
    }
    
}
