//
//  Constant.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/22.
//

import UIKit

//MARK: 디바이스의 스크린 크기
struct ScreenConstant {
    static let deviceWidth = UIScreen.main.bounds.width
    static let deviceHeight = UIScreen.main.bounds.height
    static let estimateCellSize = UIScreen.main.bounds.size.height * 0.12
}

//MARK: 원티드 로고 (원티드랩 사이트에서 로고이미지링크 추출함)
struct DefaultImgWantedLogo {
    static let wantedLogo : String = "https://static.wanted.co.kr/images/wdes/0_5.ce4fd8b1.jpg"
}

//MARK: Label.text 에 들어가는 text 값들
struct LabelText {
    static let naviTitle : String = "책을 Wanted"
    static let searchBarPlaceholder : String = "Search.. (책/작가 구분을 할 수 있어요)"
    static let headerTotalBooksLabel : String =  "📚 검색된 결과 수 :"
}

struct HttpMethods {
    static let get = "GET"
    static let post = "POST"
}

//MARK: 검색어가 없을때 alert에 띄울 문구
struct EmptyReusltErr {
    static let title : String = "🥹 검색결과가 없어요"
    static let msg : String = "책 이름이나 작가 이름이 정확한지 확인해주세요"
}
