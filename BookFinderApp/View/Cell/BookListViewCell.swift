//
//  BookListViewCell.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/21.
//

import Foundation
import SnapKit
import UIKit
import Kingfisher

class BookListViewCell : UITableViewCell {
    
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let publishDateLabel = UILabel()
    
    static let registerID = "\(BookListViewCell.self)"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setAttribute()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAttribute() {
        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.backgroundColor = .white
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
    
    func checkImgLink(_ data : BooksInfo) -> URL {
        
        guard let imgLink = data.imageLinks?.smallThumbnail else {
            thumbnailImageView.layer.borderWidth = 0.5
            thumbnailImageView.layer.borderColor = UIColor.systemGray3.cgColor
            return URL(string: DefaultImgWantedLogo.wantedLogo)!
         }
        return URL(string: imgLink)!
    }
    
    func checkAuthors(_ data : BooksInfo) -> String {
        
        guard let authorArr = data.authors else {
            return "저자가 등록되지 않았어요"
        }
        let authorData : String = authorArr.count > 2 ? "\(authorArr[0]) 외 \(authorArr.count - 1) 명" : "\(authorArr[0])"
        
        return authorData
    }
    
    func setData(_ data : BooksInfo) {
        
        
        let imgURL = checkImgLink(data)
        
        thumbnailImageView.kf.setImage(with: imgURL)
        titleLabel.text = data.title
        authorLabel.text = checkAuthors(data)
        publishDateLabel.text = data.publishedDate ?? "출판년도가 등록되지 않았어요"
        
        
    }
}

