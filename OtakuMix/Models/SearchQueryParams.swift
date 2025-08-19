//
//  QueryParams.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 20/07/25.
//

import Foundation

struct QueryParams {
    var page: Int?
    var limit: Int?
    
    func toQueryItems() -> [URLQueryItem] {
        var items: [URLQueryItem] = []
        
        if let page = page {
            items.append(URLQueryItem(name: "page", value: String(page)))
        }
        
        if let limit = limit {
            items.append(URLQueryItem(name: "page", value: String(limit)))
        }
        
        return items
    }
}
