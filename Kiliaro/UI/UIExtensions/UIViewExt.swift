//
//  UIViewExt.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

extension UIView {
    func pinToView(parentView: UIView, leading: Bool = true, trailing: Bool = true, top: Bool = true, bottom: Bool = true) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = leading
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = trailing
        self.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = top
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = bottom
    }
    
    func pinToView(parentView: UIView, constant: CGFloat, leading: Bool = true, trailing: Bool = true, top: Bool = true, bottom: Bool = true) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: constant).isActive = leading
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -constant).isActive = trailing
        self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: constant).isActive = top
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -constant).isActive = bottom
    }
    
    func centerOnView(parentView: UIView, centerX: Bool = true, centerY: Bool = true) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = centerX
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = centerY
    }
    
    func applyAspectRatio(aspectRatio: CGFloat) {
        NSLayoutConstraint(item: self,
                           attribute: NSLayoutConstraint.Attribute.width,
                           relatedBy: NSLayoutConstraint.Relation.equal,
                           toItem: self,
                           attribute: NSLayoutConstraint.Attribute.height,
                           multiplier: aspectRatio,
                           constant: 0).isActive = true
    }
    
    func showProgress() {
        guard self.viewWithTag(-self.tag) == nil else { return }
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        let spinnerView = UIView()
        spinnerView.backgroundColor = .clear
        spinnerView.tag = -self.tag
        spinnerView.isUserInteractionEnabled = true
        spinnerView.layer.cornerRadius = self.layer.cornerRadius
        var style: UIActivityIndicatorView.Style {
            if #available(iOS 13.0, *) {
                return UIActivityIndicatorView.Style.medium
            }
            
            return UIActivityIndicatorView.Style.gray
        }
        let indicator = UIActivityIndicatorView.init(style: style)
        indicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        indicator.color = .accent
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            indicator.centerOnView(parentView: spinnerView)
            self.addSubview(spinnerView)
            spinnerView.pinToView(parentView: self)
            indicator.startAnimating()
        }
        
    }
    
    func hideProgress() {
        DispatchQueue.main.async {
            self.viewWithTag(-self.tag)?.removeFromSuperview()
        }
    }
    
}
