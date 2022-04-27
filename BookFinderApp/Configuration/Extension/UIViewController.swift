//
//  UIViewController.swift
//  BookFinderApp
//
//  Created by miori Lee on 2022/04/27.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: Alert 을 띄위 위한 extension
extension UIViewController {
    
    typealias Alert = (title: String?, message: String?, actions : [AlertAction], style : UIAlertController.Style)
    
    enum AlertAction : AlertActionProtocol {
        //액션들을 선언
        case cancel
        case confirm
        
        var title: String {
            switch self {
            case .cancel :
                return "취소"
            case . confirm :
                return "확인"
            }
        }
        
        var style: UIAlertAction.Style {
            switch self {
            case .cancel, .confirm :
                return .cancel
            }
        }
    }
    
    //MARK: alert의 action을 받았을때, alertcontroller 생성하여 present
    func presentAlertController<Action : AlertActionProtocol>(_ alertController : UIAlertController, actions: [Action]) -> Signal<Action> {
        
        if actions.isEmpty {return .empty()}
        return Observable
            .create { [weak self] observer in

                guard let self = self else { return Disposables.create() }
                for action in actions {
                    alertController.addAction(
                        UIAlertAction(title: action.title, style: action.style, handler: { _ in
                            observer.onNext(action)
                            observer.onCompleted()
                        })
                    )
                }
                self.present(alertController, animated: true, completion: nil)
                // observable 생성되면 alertController dismiss
                return Disposables.create {
                    alertController.dismiss(animated: true, completion: nil)
                }
            }
            .asSignal(onErrorSignalWith: .empty())
    }
}


