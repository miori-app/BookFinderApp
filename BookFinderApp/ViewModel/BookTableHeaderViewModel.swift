//
//  BookTableHeaderViewModel.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/26.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

struct BookTableHeaderViewModel {
    
    let segmentIndex = BehaviorRelay<Int>(value: 0)
    let selectedIndex : Observable<Int>
    
    init() {
        self.selectedIndex = segmentIndex
            .asObservable()
    }
}

