//
//  Utils.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    let urlCache = URLCache()
    urlCache.memoryCapacity = 5 * 1024 * 1024
    urlCache.diskCapacity = 1024 * 1024 * 1024
    
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 60
    config.requestCachePolicy = .returnCacheDataElseLoad
    config.urlCache = urlCache
    
    let urlSession = URLSession(configuration: config)
    urlSession.dataTask(with: url) { data, response, error in
        completion(data, response, error)
    }.resume()
}
