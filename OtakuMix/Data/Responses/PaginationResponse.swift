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
}
