//
//  DataResponse.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import Foundation

struct DataResponse<T: Codable>: Decodable {
    let pagination: PaginationResponse
    let data: [T]
}
