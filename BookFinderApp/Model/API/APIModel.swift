//
//  APIModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation

struct APIModel {
    //https://www.googleapis.com/books/v1/volumes?q=
    static let scheme = "https"
    static let host = "www.googleapis.com"
    static let path = "/books/v1/volumes"
    
    func searchBooks(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = APIModel.scheme
        components.host = APIModel.host
        components.path = APIModel.path
        components.queryItems = [
            URLQueryItem(name: "q", value: "+intitle:\(query)"),
            URLQueryItem(name: "projection", value: "lite")
        ]
        return components
    }
}
