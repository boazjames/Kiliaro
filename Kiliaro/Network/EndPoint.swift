//
//  EndPoint.swift
//  Kiliaro
//
//  Created by Boaz James on 04/10/2022.
//

import Foundation

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}

protocol EndPointProtocol {
        
    var baseURL: String { get }
    var httpMethod: HttpMethod { get }
    var url: URL { get }
    var path: String { get }
    
}

enum EndPoint {
    case sharedPhotos(_: String)
}

extension EndPoint: EndPointProtocol {
    var path: String {
        switch self {
        case .sharedPhotos(let key):
            return "shared/\(key)/media"
        }
    }
    
    var baseURL: String {
        return Constant.BASE_URL
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .sharedPhotos(_):
            return .get
        }
    }
    
    var url: URL {
        return URL(string: "\(baseURL)\(path)")!
    }
    
    
}
