//
//  CharacterMapper.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 23/07/25.
//

import Foundation

extension CharacterResponse {
    func toModel() -> Character {
        return Character(
            id: malID,
            name: name,
            nicknames: nicknames,
            nameKanji: nameKanji,
            imageUrl: URL(string: images.jpg.imageURL),
            favorites: favorites,
            about: about
        )
    }
}
