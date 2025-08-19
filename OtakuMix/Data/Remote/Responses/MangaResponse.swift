//
//  MangaResponse.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import Foundation

struct MangaResponse: Decodable {
    let malID: Int
    let url: String
    let images: ImagesResponse
    let approved: Bool
    let title: String
    let titleEnglish: String?
    let titleJapanese: String
    let titleSynonyms: [String]
    let type: MangaTypeResponse
    let status: String //Talvez passar pra enu
    let publishing: Bool
    let published: AiredResponse
    let score: Double
    let scoredBy, rank, popularity, members, favorites: Int
    let synopsis, background: String
    let authors, serializations, genres, themes, demographics: [MalResourceResponse]
    
    enum CodingKeys: String, CodingKey {
         case malID = "mal_id"
         case url, images, approved, title
         case titleEnglish = "title_english"
         case titleJapanese = "title_japanese"
         case titleSynonyms = "title_synonyms"
         case type, status, publishing, published, score
         case scoredBy = "scored_by"
         case rank, popularity, members, favorites, synopsis, background, authors, serializations, genres
         case themes, demographics
     }
}

enum MangaTypeResponse: String, Decodable {
    case manga = "Manga"
    case novel = "Novel"
    case lightnovel = "Light novel"
    case oneshot = "One-shot"
    case doujin = "Doujin"
    case manhwa = "Manhwa"
    case manhua = "Manhua"
}
