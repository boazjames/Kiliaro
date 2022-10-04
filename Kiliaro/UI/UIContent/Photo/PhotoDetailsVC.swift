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
        view.backgroundColor = .darkBackgroundColor
        view.tag = 1
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "photos".localized
        
        imgView.loadImage(imgUrl: "https://imgdc1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/imageresize/i/60cc705d0025904750ee22d300020eb4/0.jpg")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavBar()
        self.changeNavBarAppearance(isLightContent: false, isTranslucent: true)
        
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
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        self.view.backgroundColor = .darkBackgroundColor
        self.view.addSubview(imgView)
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
}
