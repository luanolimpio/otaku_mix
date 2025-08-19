//
//  PaginationResponse.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import Foundation

struct PaginationResponse: Decodable {
    let lastVisiblePage: Int
    let hasNextPage: Bool
    let currentPage: Int
    let items: PaginationItemsResponse
    
    
    enum CodingKeys: String, CodingKey {
        case lastVisiblePage = "last_visible_page"
        case hasNextPage = "has_next_page"
        case currentPage = "current_page"
        case items
    }
}

struct PaginationItemsResponse: Decodable {
    let count, total, perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case count, total
        case perPage = "per_page"
    }
}
