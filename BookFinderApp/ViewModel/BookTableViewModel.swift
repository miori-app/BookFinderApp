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
  
    //MARK: 무한스크롤을 위한 startIndex 값
    /*
     - 바닥에 닿을때 마다 증감 (한번에 보여지는 아이템 수만큼)
     */
    let fetchStratIndex = BehaviorRelay<Int>(value: 0)
    
    init() {
        self.detailListCellData = apiData.asDriver(onErrorJustReturn: [] )
    }
}
