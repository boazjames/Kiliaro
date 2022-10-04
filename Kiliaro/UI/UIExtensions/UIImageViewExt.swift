//
//  UIImageViewExt.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

extension UIImageView {
    func loadImage(imgUrl: String, placeholder: String = "photo") {
        self.image = UIImage(named: placeholder)
        guard let url = URL(string: imgUrl) else { return }
                
        showProgress()
        
        getDataFromUrl(url: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            
            DispatchQueue.main.async {
                self.hideProgress()
            }
        }
    }
    
    func loadImage(imgUrl: String, placeholder: String = "photo", width: Int, height: Int, contentMode: String = "crop") {
        self.image = UIImage(named: placeholder)
        var urlComponents = URLComponents(string: imgUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "w", value: String(width)),
            URLQueryItem(name: "h", value: String(height)),
            URLQueryItem(name: "m", value: contentMode)
        ]
        guard let url = urlComponents?.url else { return }
                        
        showProgress()
        
        getDataFromUrl(url: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
            
            DispatchQueue.main.async {
                self.hideProgress()
            }
        }
    }
}
