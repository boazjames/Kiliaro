//
//  PhotoDetailsVC.swift
//  Kiliaro
//
//  Created by Boaz James on 04/10/2022.
//

import UIKit

class PhotoDetailsVC: BaseVC {
    
    private(set) var imgView: UIImageView =  {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemGray6
        } else {
            view.backgroundColor = .lightGray
        }
        view.image = UIImage(named: "photo")
        view.clipsToBounds = true
        view.backgroundColor = .whiteColor
        view.tag = 1
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    var photoItem: PhotoMedia!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavBar()
        self.changeNavBarAppearance(isLightContent: false, isTranslucent: true)
        
        hidesBottomBarWhenPushed = true
        
        updateStatusBarStyle()
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateStatusBarStyle()
    }
    
    private func updateStatusBarStyle() {
        if traitCollection.userInterfaceStyle == .dark {
            self.changeStatusBarStyle(.lightContent)
        } else {
            if #available(iOS 13.0, *) {
                self.changeStatusBarStyle(.darkContent)
            } else {
                self.changeStatusBarStyle(.default)
            }
        }
    }
    
    override func setupViews() {
        self.view.backgroundColor = .whiteColor
        self.view.addSubview(imgView)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: self.view.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    override func setupGestures() {
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleNavBarVisibility)))
    }
    
    @objc private func toggleNavBarVisibility() {
        if prefersStatusBarHidden {
            showNavBar()
            showStatusBar()
            imgView.backgroundColor = .whiteColor
        } else {
            hideNavBar()
            hideStatusBar()
            imgView.backgroundColor = .darkBackgroundColor
        }
    }
    
    private func setupData() {
        imgView.loadImage(imgUrl: photoItem.downloadURL ?? "")
        
        let date = Date.parseServerDate(dateString: photoItem.createdAt ?? "")
        
        setCustomTitle(title: date?.dateFormat() ?? "", subtitle: date?.timeFormat() ?? "", isLightContent: false)
    }
}
