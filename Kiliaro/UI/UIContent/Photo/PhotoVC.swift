//
//  PhotoVC.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//


import UIKit

class PhotoVC: BaseVC {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = .zero
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "photos".localized
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavBar()
        self.changeNavBarAppearance(isLightContent: false)
        
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
        self.view.backgroundColor = .whiteColor
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    override func setupCollectionView() {
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "cell")
    }
}

// MARK: UICollectionViewDataSource
extension PhotoVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        22
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCell
        cell.imgView.tag = indexPath.row + 1
        cell.setupData("https://imgdc1.kiliaro.com/shared/djlCbGusTJamg_ca4axEVw/imageresize/i/60cc705d0025904750ee22d300020eb4/0.jpg?w=200&h=200&m=crop")
        return cell
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension PhotoVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        
        let noOfColums: CGFloat = traitCollection.horizontalSizeClass == .compact ? 3 : 4
        
        let interItemSpacing: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) * (noOfColums - 1)
                
        let space: CGFloat = interItemSpacing + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        
        let size: CGFloat = (self.collectionView.frame.size.width - space) / noOfColums
        
        return CGSize(width: size, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoDetailsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
