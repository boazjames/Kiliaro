//
//  APIError.swift
//  Kiliaro
//
//  Created by Boaz James on 04/10/2022.
//

import Foundation

struct APIError: Error, Decodable {
    let message: String
    let isSessionTaskError: Bool
    let isAuthError: Bool
}
