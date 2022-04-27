//
//  AlertActioinProtocol.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/27.
//

import UIKit

//MARK: AlertAction에서 구현해야 할 요소 정의

protocol AlertActionProtocol{
    var title : String { get }
    var style : UIAlertAction.Style { get }
}
