//
//  BaseVC.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

class BaseVC: UIViewController {
    
    private var style: UIStatusBarStyle = .default
    private var statusBarHidden = false
    
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
    
    override var prefersStatusBarHidden: Bool {
        return statusBarHidden
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
    
    func showStatusBar() {
        self.statusBarHidden = false
        self.navigationController?.setNeedsStatusBarAppearanceUpdate()
        self.tabBarController?.setNeedsStatusBarAppearanceUpdate()
    }
    
    func hideStatusBar() {
        self.statusBarHidden = true
        self.navigationController?.setNeedsStatusBarAppearanceUpdate()
        self.tabBarController?.setNeedsStatusBarAppearanceUpdate()
    }
    
    func changeNavBarAppearance(isLightContent: Bool, isTranslucent: Bool = false) {
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            if isTranslucent {
                navBarAppearance.configureWithTransparentBackground()
                navBarAppearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            } else {
                navBarAppearance.configureWithOpaqueBackground()
            }
            
            if isLightContent {
                navBarAppearance.backgroundColor = isTranslucent ? UIColor.clear : UIColor.primary
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.whiteColor]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.whiteColor]
            } else {
                navBarAppearance.backgroundColor = isTranslucent ? UIColor.clear : UIColor.whiteColor
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.blackColor]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blackColor]
            }
            
            
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        } else {
            if isTranslucent {
                navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                navigationController?.navigationBar.shadowImage = UIImage()
            }
            
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
    
    func setCustomTitle(title: String, subtitle: String, isLightContent: Bool) {
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: isLightContent ? UIColor.whiteColor : UIColor.blackColor
        ]
        let subTitleAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                  NSAttributedString.Key.foregroundColor: isLightContent ? UIColor.whiteColor : UIColor.blackColor]
        
        let titleAttrText = NSMutableAttributedString(string: title, attributes: titleAttributes)
        let subTitleAttrText = NSMutableAttributedString(string: subtitle, attributes: subTitleAttributes)
        titleAttrText.append(NSMutableAttributedString(string: "\n"))
        titleAttrText.append(subTitleAttrText)
        
        let size = titleAttrText.size()
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        titleLabel.attributedText = titleAttrText
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
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
