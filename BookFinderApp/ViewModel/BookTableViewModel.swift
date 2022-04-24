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
  
    init() {
        self.detailListCellData = apiData.asDriver(onErrorJustReturn: [] )
    }
}
