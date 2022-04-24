//
//  BookListViewController.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BookListViewController : UIViewController {
    
    let disposeBag = DisposeBag()
    let searchController = SearchBar(searchResultsController: nil)
    let bookListView = BookTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        setLayout()
    }
}

extension BookListViewController {
    private func setAttribute(){
        title = LabelText.naviTitle
        self.navigationItem.searchController = searchController
        view.backgroundColor = .white
    }
    

    private func setLayout(){
        self.view.addSubview(bookListView)

        bookListView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func bind(_ viewModel : MainViewModel) {
        
        bookListView.bind(viewModel.bookTableViewModel)
        searchController.bind(viewModel.searchBarViewModel)
        
        viewModel.totalResultCountValue
            .drive(bookListView.headerView.totalCountLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
}
