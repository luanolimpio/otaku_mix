//
//  MangaMapperExtension.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 17/07/25.
//

import Foundation

extension MangaResponse {
    func toModel() -> Manga {
        return Manga(
            id: malID,
            title: title,
            titleEnglish: titleEnglish,
            type: MangaType(rawValue: type) ?? .manga,
            status: MangaStatus(rawValue: status) ?? .finished,
            score: score,
            posterImageURL: URL(string: images.jpg.imageURL),
            backdropImageURL: images.jpg.largeImageURL != nil ? URL(string: images.jpg.largeImageURL!) : nil,
            genres: genres.map({ $0.name }),
            synopsis: synopsis,
            year: published.from?.isoYear,
            chapters: chapters,
            volumes: volumes,
            published: published.string,
            rank: rank,
            popularity: popularity
        )
    }
}
