//
//  MainModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/25.
//

import RxSwift
import Foundation

struct MainModel {
    let network = FindBookNetwork()
    
    func searchBooks(_ query : String) -> Single<Result<GoogleBooksResponseModel, NetworkErrorModel>> {
        return network.searchNetwork(query: query)
    }
    
    func getBooksModelValue(_ searchResult : Result<GoogleBooksResponseModel, NetworkErrorModel>) -> GoogleBooksResponseModel? {
        guard case .success(let value) = searchResult else {
            return nil
        }
        return value
    }
}
