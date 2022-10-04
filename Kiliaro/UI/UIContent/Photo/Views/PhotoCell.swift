//
//  PhotoCell.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    private(set) var imgView: UIImageView =  {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemGray6
        } else {
            view.backgroundColor = .lightGray
        }
        view.image = UIImage(named: "photo")
        view.clipsToBounds = true
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let size = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(size, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
    
    private func setup() {
        self.backgroundColor = .clear
        self.contentView.addSubview(imgView)
        
        self.contentView.pinToView(parentView: self)
        
        imgView.applyAspectRatio(aspectRatio: 1)
        
        imgView.pinToView(parentView: self.contentView)
    }
    
    func setupData(_ item: String) {
        imgView.loadImage(imgUrl: item)
    }
}
