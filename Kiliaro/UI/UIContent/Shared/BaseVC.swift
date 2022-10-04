//
//  BaseVC.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

class BaseVC: UIViewController {
    
    private var style: UIStatusBarStyle = .default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tag = 1200000
        changeStatusBarStyle(.lightContent)
                
        changeNavBarAppearance(isLightContent: true)
        
        setupViews()
        setupContraints()
        setupSharedContraints()
        setupCollectionView()
        setupGestures()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        setupContraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 14.0, *) {
            self.navigationItem.backButtonDisplayMode = .minimal
        }
    }
    
    func changeStatusBarStyle(_ style: UIStatusBarStyle) {
        self.style = style
        self.navigationController?.setNeedsStatusBarAppearanceUpdate()
        self.tabBarController?.setNeedsStatusBarAppearanceUpdate()
    }
    
    func changeNavBarAppearance(isLightContent: Bool, isTranslucent: Bool = false) {
        
        if #available(iOS 13.0, *) {
            if isLightContent {
                let navBarAppearance = UINavigationBarAppearance()
                if isTranslucent {
                    navBarAppearance.configureWithTransparentBackground()
                } else {
                    navBarAppearance.configureWithOpaqueBackground()
                }
                
                navBarAppearance.backgroundColor = .primary
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.whiteColor]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.whiteColor]
                navigationController?.navigationBar.standardAppearance = navBarAppearance
                navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            } else {
                let navBarAppearance = UINavigationBarAppearance()
                if isTranslucent {
                    navBarAppearance.configureWithTransparentBackground()
                } else {
                    navBarAppearance.configureWithOpaqueBackground()
                }
                navBarAppearance.backgroundColor = .whiteColor
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.blackColor]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blackColor]
                navigationController?.navigationBar.standardAppearance = navBarAppearance
                navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            }
        } else {
            if isLightContent {
                navigationController?.navigationBar.isTranslucent = isTranslucent
                navigationController?.navigationBar.tintColor = .whiteColor
                navigationController?.navigationBar.barTintColor = .primary
                navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                                                                   .foregroundColor: UIColor.whiteColor]
            } else {
                navigationController?.navigationBar.isTranslucent = isTranslucent
                navigationController?.navigationBar.tintColor = .accent
                navigationController?.navigationBar.barTintColor = .whiteColor
                navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                                                           .foregroundColor: UIColor.blackColor]
            }
        }
    }
    
    func showNavBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func hideNavBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc
    func navigateBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func dismissViewController() {
        self.dismiss(animated: true)
    }
    
    func setupViews() {}
    
    func setupGestures() {}
    
    func setupLabels() {}
        
    func setupCollectionView() {}
        
    func setupSharedContraints() {}
    
    func setupContraints() {}
}
