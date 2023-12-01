//
//  ApiCaller.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/11/30.
//

import Foundation
import Alamofire
import Combine

// 에러 커스텀 정의하기
enum APIError: Error { //LocalizedError
    case invalidURL
    case invalidResponse
    case invalidData
    case faildDecode
}


final class ApiCaller: NSObject {
    static let shared = ApiCaller()
    private let baseUrl = "http://3.35.138.150/v1/"
    
    private override init() {}
    
    //MARK: - GET
    /// get method 통신을 사용
    func getData<T:Codable>(endUrl:String, parameters: [String:Any]?, returnType: T.Type, completion: @escaping (Result<T, APIError>) -> Void ) {

        let url = baseUrl + endUrl

        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).response { response in
            // 헤더 확인
            let header = response.response
//            print("헤더:\(header)")
//            print("리퀘스트 확인:\(response.request)")
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
    
//    URLEncoding.httpBody
//    JSONEncoding.default
    
    //MARK: - POST
    /// post method 통신을 사용
    func postData<T:Codable>(endUrl:String, parameters: [String:Any]?, returnType: T.Type, completion: @escaping (Result<T, APIError>) -> Void ) {

        let url = baseUrl + endUrl

        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).response { response in
            // 헤더 확인
            let header = response.response
//            print("헤더:\(header)")
//            print("리퀘스트 확인:\(response.request)")
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
    
    
    
    
    
    /// get method 통신을 사용
//    func getData<T:Codable>(endUrl:String, parameters: [String:Any]?, returnType: T.Type) -> AnyPublisher<T, AFError> {
//
//        let url = baseUrl + endUrl
//        print("full url:\(url)")
//        return AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString))
//            .validate()
//            .publishDecodable(type: returnType.self)
//            .value()
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//
//    }
    
    
}
