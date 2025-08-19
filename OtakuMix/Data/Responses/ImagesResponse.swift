//
//  ImageURLsResponse.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import Foundation

struct ImageResponse: Codable {
    let jpg: ImageURLs
    let webp: ImageURLs
}

struct ImageURLsResponse: Decodable {
    let imageURL, smallImageURL, largeImageURL: String

    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case smallImageURL = "small_image_url"
        case largeImageURL = "large_image_url"
    }
}
