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
    let bookTableHeaderViewModel = BookTableHeaderViewModel()
    
    let totalResultCountValue : Driver<String>
    
    // #16 이슈 해결하기 위해 새로 추가
    var cellData: Observable<[BooksItems]>
    
    let fetchData : Observable<[BooksItems]>
    
    // alert action 탭 했을때 이벤트 확인하기위함
    let alertActionTapped = PublishRelay<BookListViewController.AlertAction>()
    let shouldPresentAlert : Signal<BookListViewController.Alert>
    
    init(_ model : MainModel = MainModel()) {
        
        // 검색어와, 검색타겟(책/작가)  + startIndex 값을 받아, convertSearchQuery 를 통해 SearchQuery 형태로
        let searchQueryStruct = Observable
            .combineLatest(searchBarViewModel.shouldLoadResult, bookTableHeaderViewModel.selectedIndex, bookTableViewModel.fetchStratIndex, resultSelector: model.convertSearchQuery)
        
        
        let searchBookResult = searchQueryStruct
            .flatMapLatest(model.searchBooks)
            .share()
        
        let searchBookValue = searchBookResult
            .compactMap(model.getBooksModelValue)
        
        let searchBookError = searchBookResult
            .compactMap(model.getBooksModelError)
        
         // # 16 이슈 해결 하기 위해 변경 (let cellData -> 외부에서 var cellData  접근할수 있게)
         fetchData = searchBookValue
            .map { $0.items ?? [] }
        
//        # 16 이슈 해결 하기 위해 변경 (삭제)
//        cellData
//            .debug()
//            .bind(to: bookTableViewModel.apiData)
//            .disposed(by: disposeBag)
        
        cellData = fetchData
            .scan([]) { $0 + $1 }
        
        cellData
            .bind(to : bookTableViewModel.apiData)
            .disposed(by: disposeBag)
        
        let totalResultCount = searchBookValue
            .map { "\(LabelText.headerTotalBooksLabel) \($0.totalItems)" }

        self.totalResultCountValue = totalResultCount
            .asDriver(onErrorJustReturn: "\(LabelText.headerTotalBooksLabel) 0")
        
        
        //MARK: 검색결과가 없을 때
        let emptyAlertMsg = searchBookValue
            .map { $0.totalItems }
            .filter { $0 == 0 }
            .map { _ -> BookListViewController.Alert in
                return (
                    title : EmptyReusltErr.title,
                    message : EmptyReusltErr.msg,
                    actions : [.confirm],
                    style : .alert
                )
            }
        
        let errAlertMsg = searchBookError
            .map { msg -> BookListViewController.Alert in
                return (
                    title : "⚠️",
                    message : "\(msg)",
                    actions : [.confirm],
                    style : .alert
                )
            }
        
        
        self.shouldPresentAlert = Observable
            .merge(emptyAlertMsg , errAlertMsg)
            .asSignal(onErrorSignalWith: .empty())
    }

}
