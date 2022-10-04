//
//  PhotoMedia.swift
//  Kiliaro
//
//  Created by Little Developers on 04/10/2022.
//

import Foundation

// MARK: - PhotoMedia
struct PhotoMedia: Codable {
    let id: String?
    let userID: String?
    let mediaType: String?
    let filename: String?
    let size: Int?
    let createdAt: String?
    let takenAt, guessedTakenAt: String?
    let md5Sum: String?
    let contentType: String?
    let video: String?
    let thumbnailURL, downloadURL: String?
    let resx, resy: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case mediaType = "media_type"
        case filename, size
        case createdAt = "created_at"
        case takenAt = "taken_at"
        case guessedTakenAt = "guessed_taken_at"
        case md5Sum = "md5sum"
        case contentType = "content_type"
        case video
        case thumbnailURL = "thumbnail_url"
        case downloadURL = "download_url"
        case resx, resy
    }
}

typealias PhotoMediaResponse = [PhotoMedia]
