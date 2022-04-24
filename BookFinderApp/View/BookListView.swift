//
//  BookListView.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BookListView : UITableView {
    
    let disposeBag = DisposeBag()
    let headerView = BookTableViewHeaderView(frame: CGRect(origin: .zero, size: CGSize(width: ScreenConstant.deviceWidth, height: 30)))
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        setTableView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableView() {
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = UIScreen.main.bounds.size.height * 0.12
        self.backgroundColor = .white
        self.register(BookListViewCell.self, forCellReuseIdentifier: BookListViewCell.registerID)
        self.separatorStyle = .singleLine
        self.tableHeaderView = headerView
    }

}
