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
    }
    
    private func setLayout() {
        [totalCountLabel, bottomBorder].forEach {addSubview($0)}
        
        totalCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
        }
        
        bottomBorder.snp.makeConstraints {
            $0.top.equalTo(totalCountLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}
