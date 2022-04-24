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
    let bookListView = BookListView()
    let searchBarViewModel = SearchBarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        setLayout()
    }
}

extension BookListViewController {
    private func setAttribute(){
        title = "책을 Wanted"
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
        
        bookListView.rx.itemSelected
            .bind { [weak self] indexPath in
                self?.bookListView.deselectRow(at: indexPath, animated: false)
            }
            .disposed(by: disposeBag)
        
        viewModel.detailListCellData
            .drive(bookListView.rx.items(cellIdentifier: BookListViewCell.registerID, cellType: BookListViewCell.self)) { [weak self] row, element, cell in
                cell.setData(element.volumeInfo)
            }
            .disposed(by: disposeBag)

        searchController.bind(viewModel.searchBarViewModel)
        
        viewModel.totalResultCountValue
            .drive(bookListView.headerView.totalCountLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
