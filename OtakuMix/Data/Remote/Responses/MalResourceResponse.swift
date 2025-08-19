//
//  MalResourceResponse.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import Foundation

struct MalResourceResponse: Decodable {
    let malID: Int
    let type: String
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case type, name, url
    }
}
