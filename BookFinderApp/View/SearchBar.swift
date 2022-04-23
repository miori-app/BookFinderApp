//
//  SearchBar.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SearchBar : UISearchController {
    
    let disposeBag = DisposeBag()
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: nil)
        setSearchBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSearchBar() {
        self.searchBar.placeholder = "검색할 책 이름을 적어주세요"
    }
    
    func bind(_ viewModel : SearchBarViewModel) {
        self.searchBar.rx.text
            .bind(to: viewModel.inputQuery)
            .disposed(by: disposeBag)
        
        self.searchBar.rx.searchButtonClicked
            .asObservable()
            .bind(to: viewModel.searchBtnTapped)
            .disposed(by: disposeBag)
    }
}
