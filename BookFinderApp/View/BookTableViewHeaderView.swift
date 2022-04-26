//
//  BookTableViewHeaderView.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/22.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class BookTableViewHeaderView : UITableViewHeaderFooterView {
    
    let totalCountLabel = UILabel()
    let bottomBorder = UIView()
    let searchTargetSegment = UISegmentedControl(items: ["책","작가"])
    
    let disposeBag = DisposeBag()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setAttribute()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setAttribute() {
        totalCountLabel.font = .systemFont(ofSize: 10, weight: .medium)
        totalCountLabel.text = LabelText.headerTotalBooksLabel
        bottomBorder.backgroundColor = .systemGray3
        
        searchTargetSegment.selectedSegmentIndex = 0
        searchTargetSegment.selectedSegmentTintColor = .white
        searchTargetSegment.backgroundColor = UIColor.systemGray3
    }
    
    private func setLayout() {
        [totalCountLabel, bottomBorder, searchTargetSegment].forEach {addSubview($0)}
        
        totalCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.top.equalTo(totalCountLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        searchTargetSegment.snp.makeConstraints {
            $0.centerY.equalTo(totalCountLabel)
            $0.trailing.equalToSuperview().inset(12)
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    func bind(_ viewModel : BookTableHeaderViewModel) {

        self.searchTargetSegment.rx.selectedSegmentIndex
            .bind(to: viewModel.segmentIndex)
            .disposed(by: disposeBag)
        
    }
}
