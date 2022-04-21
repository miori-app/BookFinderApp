//
//  SearchBar.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation
import UIKit
import SnapKit

class SearchBar : UISearchController {
    
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
}
