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
    
    func searchBooks(_ query : SearchQuery) -> Single<Result<GoogleBooksResponseModel, NetworkErrorModel>> {
        return network.searchNetwork(query: query)
    }
    
    func getBooksModelValue(_ searchResult : Result<GoogleBooksResponseModel, NetworkErrorModel>) -> GoogleBooksResponseModel? {
        guard case .success(let value) = searchResult else {
            return nil
        }
        return value
    }
    
    func getBooksModelError(_ searchResult : Result<GoogleBooksResponseModel, NetworkErrorModel>)  -> String? {
        guard case .failure(let error) = searchResult else {
            return nil
        }
        return error.message
    }
    
    //MARK: 검색어와, (책제목/작가) 를 각각 받아 SearchQuery 형태로 반환
    /*
     - 네트워크 통신시, 파라미터로 넣기 위함
     */
    func convertSearchQuery(_ query : String, _ target : Int, _ startIndex : Int) -> SearchQuery {
        return SearchQuery(query: query, target: target, startIndex: startIndex)
    }
}

