//
//  APIModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation

struct SearchQuery {
    var query : String
    var target : Int
    var startIndex : Int
}

struct MaxResults {
    static let maxResult : Int = 20
}

struct APIModel {
    //https://www.googleapis.com/books/v1/volumes?q=
    static let scheme = "https"
    static let host = "www.googleapis.com"
    static let path = "/books/v1/volumes"
    
    func searchBooks(query: SearchQuery) -> URLComponents {
        var queryTarget : String = ""
        queryTarget = query.target == 0 ? "+intitle:" : "+inauthor:"
        var components = URLComponents()
        components.scheme = APIModel.scheme
        components.host = APIModel.host
        components.path = APIModel.path
        components.queryItems = [
            URLQueryItem(name: "q", value: "\(queryTarget)\(query.query)"),
            URLQueryItem(name: "projection", value: "lite"),
            URLQueryItem(name: "maxResults", value: "\(MaxResults.maxResult)"),
            URLQueryItem(name: "startIndex", value: "\(query.startIndex)")
        ]
        return components
    }
}
