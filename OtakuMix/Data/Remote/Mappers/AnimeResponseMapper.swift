//
//  AnimeMapperExtension.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 17/07/25.
//

import Foundation

extension AnimeResponse {
    func toModel() -> Anime {
        return Anime(
            id: malID,
            title: title,
            titleEnglish: titleEnglish,
            type: AnimeType(rawValue: type) ?? .tv,
            source: source,
            status: AnimeStatus(rawValue: status) ?? .finishedAiring,
            score: score,
            posterImageURL: URL(string: images.jpg.imageURL),
            backdropImageURL: images.jpg.largeImageURL != nil ? URL(string: images.jpg.largeImageURL!) : nil,
            genres: genres.map({ $0.name }),
            trailerURL: trailer.url != nil ? URL(string: trailer.url!) : nil,
            synopsis: synopsis,
            year: year,
            duration: duration,
            episodes: episodes,
            aired: aired.string,
            rating: rating,
            rank: rank,
            popularity: popularity
        )
    }
}
