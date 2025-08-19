//
//  AiredResponse.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import Foundation

//Adicionar decoder
//let decoder = JSONDecoder()
//let formatter = DateFormatter()
//formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // ou use xxx para o +00:00
//formatter.locale = Locale(identifier: "en_US_POSIX")
//decoder.dateDecodingStrategy = .formatted(formatter)
//
//let result = try decoder.decode(AiredResponse.self, from: jsonData)
struct AiredResponse: Decodable {
    let from: Date
    let to: Date?
    let string: String
}
