//
//  UIImageViewExt.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

extension UIImageView {
    func loadImage(imgUrl: String, placeholder: String = "photo") {
        guard let url = URL(string: imgUrl) else { return }
                
        self.image = UIImage(named: placeholder)
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
        
//        let config = URLSessionConfiguration()
//        config.timeoutIntervalForRequest = 60
//        config.requestCachePolicy = .useProtocolCachePolicy
//        let urlSession = URLSession(configuration: config, delegate: self, delegateQueue: .current)
//        urlSession.dataTask(with: url) { data, response, error in
//            if let data = data, let image = UIImage(data: data) {
//                self.image = image
//            }
//            self.hideProgress()
//        }.resume()
    }
}

// Mark:- URLSessionDelegate
extension UIImageView: URLSessionDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask,
                    willCacheResponse proposedResponse: CachedURLResponse,
                    completionHandler: @escaping (CachedURLResponse?) -> Void) {
        
        let updatedResponse = CachedURLResponse(response: proposedResponse.response,
                                                data: proposedResponse.data,
                                                userInfo: proposedResponse.userInfo,
                                                storagePolicy: .allowed)
        completionHandler(updatedResponse)
    }
}
