//
//  BookTableViewHeaderViewModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/22.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class BookTableViewModel {
    let disposeBag = DisposeBag()

    let detailListCellData : Driver<[BooksItems]>
    let apiData = PublishSubject<[BooksItems]>()
  
    let fetchMoreDatas = PublishSubject<Void>()
    
    init() {
        self.detailListCellData = apiData.asDriver(onErrorJustReturn: [] )
        fetchMore()
    }
    
    private func fetchMore() {
        fetchMoreDatas.subscribe { [weak self] _ in
            guard let self = self else { return }
            print("load")
        }
        .disposed(by: disposeBag)
    }
}
