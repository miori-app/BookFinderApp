//
//  GoogleBooksResponseModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation

struct GoogleBooksResponseModel : Decodable {
    var totalItems : Int
    var items : [BooksItems]
}

struct BooksItems : Decodable {
    var volumeInfo : BooksInfo
}

struct BooksInfo : Decodable {
    var title : String
    var subtitle : String?
    var authors : [String]?
    var publishedDate : String?
    var imageLinks : BooksImg?
}

struct BooksImg : Decodable {
    var smallThumbnail : String?
    var Thumbnail : String?
}
