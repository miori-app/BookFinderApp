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
    
    init(_ model : MainModel = MainModel()) {
        
        let searchBookResult = searchBarViewModel.shouldLoadResult
            .flatMapLatest(model.searchBooks)
            .share()
        
        let searchBookValue = searchBookResult
            .compactMap(model.getBooksModelValue)
        
                
        let cellData = searchBookValue
            .map { $0.items }
        
        
        cellData
            .debug("cellData")
            .bind(to: bookTableViewModel.apiData)
        
        let totalResultCount = searchBookValue
            .map { "\(LabelText.headerTotalBooksLabel) \($0.totalItems)" }

        self.totalResultCountValue = totalResultCount
            .asDriver(onErrorJustReturn: "\(LabelText.headerTotalBooksLabel) 0")
    }

}
