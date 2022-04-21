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
    
    let searchController = SearchBar(searchResultsController: nil)
    let bookListView = BookListView()
    

    let sampleData : [CellDataModel] = [
        CellDataModel(thumbnailURL: nil, title: "ddd", author: "dd", datetime: "dd-dd-dd"),
        CellDataModel(thumbnailURL: nil, title: "dddddddddddddddddddddddddddddddddddddddddddddd", author: "dd", datetime: "dd-dd-dd"),
        CellDataModel(thumbnailURL: nil, title: "ddd", author: "dd", datetime: "dd-dd-dd")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setAttribute()
        setLayout()
        DispatchQueue.main.async {
            self.setTableView()
            self.bookListView.reloadData()
        }
    }
}

extension BookListViewController {
    private func setAttribute(){
        title = "책을 Wanted"
        self.navigationItem.searchController = searchController
        view.backgroundColor = .white
    }
    
    private func setTableView() {
        bookListView.delegate = self
        bookListView.dataSource = self
    }
    private func setLayout(){
        self.view.addSubview(bookListView)
        
        bookListView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}


extension BookListViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let detailCell = tableView.dequeueReusableCell(withIdentifier: BookListViewCell.registerID, for: indexPath) as? BookListViewCell else {
            return UITableViewCell()
        }
        detailCell.setData(sampleData[indexPath.row])
        cell = detailCell
        return cell
    }
    
    
}
