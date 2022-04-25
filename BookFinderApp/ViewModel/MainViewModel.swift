//
//  MainViewModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/22.
//

import Foundation
import RxCocoa
import RxSwift

struct MainViewModel {
    let disposeBag = DisposeBag()
    
    let searchBarViewModel = SearchBarViewModel()
    let bookTableViewModel = BookTableViewModel()
    
    let totalResultCountValue : Driver<String>
    
    // #16 이슈 해결하기 위해 새로 추가
    var cellData: Observable<[BooksItems]>
    
    init(_ model : MainModel = MainModel()) {
        
        let searchBookResult = searchBarViewModel.shouldLoadResult
            .flatMapLatest(model.searchBooks)
            .share()
        
        let searchBookValue = searchBookResult
            .compactMap(model.getBooksModelValue)
        
         // # 16 이슈 해결 하기 위해 변경 (let cellData -> 외부에서 var cellData  접근할수 있게)
         cellData = searchBookValue
            .map { $0.items }
        
//        # 16 이슈 해결 하기 위해 변경 (삭제)
//        cellData
//            .debug()
//            .bind(to: bookTableViewModel.apiData)
//            .disposed(by: disposeBag)
        
        let totalResultCount = searchBookValue
            .map { "\(LabelText.headerTotalBooksLabel) \($0.totalItems)" }

        self.totalResultCountValue = totalResultCount
            .asDriver(onErrorJustReturn: "\(LabelText.headerTotalBooksLabel) 0")
    }

}
