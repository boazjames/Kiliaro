//
//  APIManager.swift
//  Kiliaro
//
//  Created by Boaz James on 04/10/2022.
//

import Foundation
import Network

class APIManager: NSObject {
    
    private var session: URLSession!
    
    override init() {
        super.init()
        
        let urlCache = URLCache()
        urlCache.memoryCapacity = 5 * 1024 * 1024
        urlCache.diskCapacity = 1024 * 1024 * 1024
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        config.urlCache = urlCache
        
        session = URLSession(configuration: config)
    }
    
    func makeRequest<T:Decodable>(_ decodable: T.Type, endPoint: EndPoint, requestData: Data? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
        
        var urlRequest = URLRequest(url: endPoint.url)
        urlRequest.httpMethod = endPoint.httpMethod.rawValue
        urlRequest.httpBody = requestData
        
        session.dataTask(with: endPoint.url) { data, response, error in
            if let data = data {
                if let decodedData = try? JSONDecoder().decode(decodable, from: data) {
                    completion(.success(decodedData))
                } else {
                    debugPrint("Serialization failure for: ", String(data: data, encoding: .utf8) ?? "")
                    let apiError = APIError(message: "general_api_eror_message".localized, isSessionTaskError: false, isAuthError: false)
                    completion(.failure(apiError))
                }
            } else if let error = error as? URLError, error.code == .notConnectedToInternet {
                debugPrint("Internet coneection issue")
                let apiError = APIError(message: "", isSessionTaskError: true, isAuthError: false)
                completion(.failure(apiError))
            } else if let response = response as? HTTPURLResponse, response.statusCode == 401 {
                debugPrint("Unuathorized error")
                let apiError = APIError(message: "net_eror_message".localized, isSessionTaskError: true, isAuthError: true)
                completion(.failure(apiError))
            } else {
                debugPrint("API error: ", String(describing: error?.localizedDescription))
                let apiError = APIError(message: "general_api_eror_message".localized, isSessionTaskError: false, isAuthError: false)
                completion(.failure(apiError))
            }
        }.resume()
        
    }
}

