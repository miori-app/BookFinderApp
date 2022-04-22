//
//  NetworkErrorModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation

//MARK: API 통신시 발생할 수 있는 에러 (URLError)와 이후 에러에 따라 메세지 출력하기 위함

enum NetworkErrorModel : Error {
    case badURL
    case cannotParseResponse
    case cannotLoadFromNetwork
    
    var message: String {
        switch self {
        case .badURL :
            return "데이터를 불러올 수 없어요 (URLERR)."
        case . cannotParseResponse :
            return "데이터를 불러올 수 없어요 (JSONERR)."
        case .cannotLoadFromNetwork :
            return "네트워크 상태를 확인해주세요 (NETWORKERR)"
        }
    }
}
