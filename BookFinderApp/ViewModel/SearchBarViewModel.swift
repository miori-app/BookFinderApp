//
//  SearchBarViewModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import RxSwift
import RxCocoa

struct SearchBarViewModel {
    // text 받기위해 (UI event)
    let inputQuery = PublishRelay<String?>()
    // search bar btn tap event
    // onNext 만 받고 error를 받지 않아
    let searchBtnTapped = PublishRelay<Void>()
    // search bar 외부로 이벤트 내보내기 (text)
    let shouldLoadResult : Observable<String>
    
    init() {
        //버튼 - 쿼리인풋
        self.shouldLoadResult = searchBtnTapped
            .withLatestFrom(inputQuery) { $1 ?? "" }
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
    }
}
