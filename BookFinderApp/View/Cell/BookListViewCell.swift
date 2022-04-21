//
//  BookListViewCell.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation
import SnapKit
import UIKit

class BookListViewCell : UITableViewCell {
    
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let publishDateLabel = UILabel()
    
    static let registerID = "\(BookListViewCell.self)"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAttribue()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAttribue() {
        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.backgroundColor = .gray
        titleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        authorLabel.font = .systemFont(ofSize: 14)
        [titleLabel,authorLabel].forEach {$0.numberOfLines = 0 }
        publishDateLabel.font = .systemFont(ofSize: 12, weight: .light)
    }
    
    private func setLayout() {
        [thumbnailImageView,titleLabel,authorLabel,publishDateLabel].forEach {
            contentView.addSubview($0)
        }
        thumbnailImageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(contentView).multipliedBy(0.15)
            $0.height.equalTo(thumbnailImageView.snp.width).multipliedBy(1.3)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(17.5)
            $0.trailing.equalToSuperview().inset(20)
        }
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleLabel)
        }
        publishDateLabel.snp.makeConstraints {
            $0.top.equalTo(authorLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalTo(titleLabel)
            $0.bottom.equalToSuperview().inset(12)
        }
        
    }
    
    func setData(_ data : CellDataModel) {
        titleLabel.text = data.title
        authorLabel.text = data.author
        publishDateLabel.text = data.datetime
    }
}
