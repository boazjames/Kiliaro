//
//  UIViewControllerExt.swift
//  Kiliaro
//
//  Created by Little Developers on 05/10/2022.
//

import UIKit

extension UIViewController {
    func showWarningAlert(_ message: String) {
        let alert = UIAlertController(title: "oops".localized, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok".localized, style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func showNetworkError(actionButtonClosure: @escaping () -> Void) {
        let alert = UIAlertController(title: "connectivity_issue".localized, message: "net_eror_message".localized, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "cancel".localized, style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "retry".localized, style: .default, handler: { (action) in
            actionButtonClosure()
        }))
        
        self.present(alert, animated: true)
    }
}
