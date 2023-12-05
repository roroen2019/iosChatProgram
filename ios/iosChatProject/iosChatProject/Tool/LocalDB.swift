//
//  LocalDB.swift
//  iosChatProject
//
//  Created by 이상준 on 2023/12/01.
//

import Foundation
import RealmSwift

class LocalDB {
    static let shared = LocalDB()
    
    // 릴름 인스턴스 생성
    lazy var realm: Realm? = {
        do {
            return try Realm()
        } catch {
            print("Could not access Realm, \(error)")
            return nil
        }
    }()
    
    
    /// 데이터 읽기
    func dataRead<T:Object>(model:T.Type) -> Results<T>? {
        // 기존 정보가 있는지 확인한다.
        let info = realm?.objects(model.self)
        let count = info?.count ?? 0
        
        if count > 0 {
            // 데이터가 있을경우
            return info
        } else {
            return nil
        }
    }
    
    /// 데이터 저장
    func dataSave(model:Object, completion:@escaping (Result<Bool, Error>) -> Void) {
        do {
            try realm?.write {
                realm?.add(model)
                
                completion(.success(true))
            }
        } catch {
            print("Error save: \(error)")
            completion(.failure(error))
        }
    }
    
    
    /// 데이터 삭제
    func dataDelete(model:Object? = nil, completion:@escaping (Error?) -> Void) {
        
        if model == nil {
            // 모든 데이터 삭제
            do {
                try realm?.write {
                    realm?.deleteAll()
                    
                    completion(nil)
                }
            } catch {
                print("Error all delete: \(error)")
                completion(error)
            }
        } else {
            // 특정 데이터 삭제
            do {
                try realm?.write {
                    realm?.delete(model!)
                    
                    completion(nil)
                }
            } catch {
                print("Error delete: \(error)")
                completion(error)
            }
        }
        
        
        
    }
    
}
