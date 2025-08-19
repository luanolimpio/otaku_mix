//
//  AnimeResponse.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import Foundation

struct AnimeResponse: Decodable {
    let malID: Int
    let url: String
    let images: ImagesResponse
    let trailer: TrailerResponse
    let approved: Bool
    let title: String
    let titleEnglish: String?
    let titleJapanese: String
    let titleSynonyms: [String]
    let type: AnimeTypeResponse
    let source: String
    let episodes: Int?
    let status: String //Talvez passar pra enum
    let airing: Bool
    let aired: AiredResponse
    let duration: String
    let rating: String
    let score: Double
    let scoredBy: Int
    let rank: Int
    let popularity: Int
    let members: Int
    let favorites: Int
    let synopsis: String
    let background: String
    let season: String?
    let year: Int?
    let broadcast: BroadcastResponse
    let producers, licensors, studios, genres, explicitGenres, themes: [MalResourceResponse]

    
    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case url, images, trailer, approved, title
        case titleEnglish = "title_english"
        case titleJapanese = "title_japanese"
        case titleSynonyms = "title_synonyms"
        case type, source, episodes, status, airing, aired, duration, rating, score
        case scoredBy = "scored_by"
        case rank, popularity, members, favorites, synopsis, background, season, year, broadcast
        case producers, licensors, studios, genres
        case explicitGenres = "explicit_genres"
        case themes
    }
}

struct TrailerResponse: Decodable {
    let youtubeID: String?
    let url: String?
    let embedURL: String?

    enum CodingKeys: String, CodingKey {
        case youtubeID = "youtube_id"
        case url
        case embedURL = "embed_url"
    }
}

enum AnimeTypeResponse: String, Decodable {
    case tv = "TV"
    case movie = "Movie"
    case ova = "OVA"
    case special = "Special"
    case ona = "ONA"
    case music = "Music"
    case cm = "CM"
    case pv = "PV"
    case tvSpecial = "TV Special"
}

struct BroadcastResponse: Decodable {
    let day, time, timezone, string: String?
}


