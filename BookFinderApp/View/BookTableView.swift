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

class BookTableView : UITableView {
    
    let disposeBag = DisposeBag()
    let headerView = BookTableViewHeaderView(frame: CGRect(origin: .zero, size: CGSize(width: ScreenConstant.deviceWidth, height: 30)))
    let headerViewModel = BookTableHeaderViewModel()
    var lastPostion : CGFloat = 0.0
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .plain)
        
        setTableView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableView() {
        self.backgroundColor = .white
        self.register(BookListViewCell.self, forCellReuseIdentifier: BookListViewCell.registerID)
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = ScreenConstant.deviceHeight * 0.12
        self.separatorStyle = .singleLine
        self.tableHeaderView = headerView
    }
    
    func bind(_ viewModel : BookTableViewModel) {
        
        self.rx.itemSelected
            .bind { [weak self] indexPath in
                self?.deselectRow(at: indexPath, animated: false)
            }
            .disposed(by: disposeBag)
        
        viewModel.detailListCellData
        //.debug()
            .drive(self.rx.items(cellIdentifier: BookListViewCell.registerID, cellType: BookListViewCell.self)) { row, element, cell in
                cell.setData(element.volumeInfo)
            }
            .disposed(by: disposeBag)
        
        self.rx.didScroll
            .throttle(.seconds(3), latest: false, scheduler: MainScheduler.instance)
        //.debug()
            .filter {
                let offsetY  = self.contentOffset.y
                let totalScrollViewHeight = self.contentSize.height
                let nowScrollViewHeight = self.frame.size.height
                return offsetY > (totalScrollViewHeight - nowScrollViewHeight - ScreenConstant.estimateCellSize * 3) && self.lastPostion < offsetY
            }
            .withLatestFrom(viewModel.fetchStratIndex) { $1 }
            .scan(0) { (pre,new) in
                pre + MaxResults.maxResult
            }
            //.subscribe {print("\($0)")} //ok
            .bind(to: viewModel.fetchStratIndex)
            .disposed(by: disposeBag)
    }
}
