//
//  MainNavigationVC.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

class MainNavigationVC: UINavigationController {
    private var supportedOrientation: UIInterfaceOrientationMask = .all
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

// Mark: UINavigationControllerDelegate
extension MainNavigationVC: UINavigationControllerDelegate {
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        self.topViewController?.supportedInterfaceOrientations ?? .all
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        self.topViewController?.preferredInterfaceOrientationForPresentation ?? .portrait
    }
}
