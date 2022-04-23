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
    let detailListCellData : Driver<[BooksItems]>
    let networkModel = FindBookNetwork()
    let apiData = PublishSubject<[BooksItems]>()
    
    
    init(_ networkModel : FindBookNetwork = FindBookNetwork()) {
        
        func searchBook(_ query : String) -> Single<Result<GoogleBooksResponseModel,NetworkErrorModel>> {
            return networkModel.searchNetwork(query: query)
        }
        
        let searchBookResult = searchBarViewModel.shouldLoadResult
            .flatMapLatest(searchBook)
            .share()
        
        let searchBookResultValue = searchBookResult
            .compactMap { data -> GoogleBooksResponseModel? in
                guard case let .success(value) = data
                else {
                    return nil
                }
                return value
            }
        
        let cellData = searchBookResultValue
            .map { $0.items }
        
        cellData
            .bind(to: apiData)
            .disposed(by: disposeBag)
        
        self.detailListCellData = apiData
            .asDriver(onErrorJustReturn: [])
        
    }
}
