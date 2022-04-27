//
//  Constant.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/22.
//

import UIKit

struct ScreenConstant {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    static let estimateCellSize = UIScreen.main.bounds.size.height * 0.12
}

struct DefaultImgWantedLogo {
    static let wantedLogo : String = "https://static.wanted.co.kr/images/wdes/0_5.ce4fd8b1.jpg"
}

struct LabelText {
    static let naviTitle : String = "책을 Wanted"
    static let searchBarPlaceholder : String = "Search.. (책/작가 구분을 할 수 있어요)"
    static let headerTotalBooksLabel : String =  "📚 검색된 결과 수 :"
}

struct HttpMethods {
    static let get = "GET"
    static let post = "POST"
}

struct EmptyReusltErr {
    static let title : String = "🥹 검색결과가 없어요"
    static let msg : String = "책 이름이나 작가 이름이 정확한지 확인해주세요"
}
