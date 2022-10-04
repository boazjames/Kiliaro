//
//  Utils.swift
//  Kiliaro
//
//  Created by Boaz James on 03/10/2022.
//

import UIKit

func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 60
    config.requestCachePolicy = .returnCacheDataElseLoad
    let urlSession = URLSession(configuration: .default)
    urlSession.dataTask(with: url) { data, response, error in
        completion(data, response, error)
    }.resume()
}
