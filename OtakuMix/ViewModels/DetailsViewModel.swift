//
//  AnimeDetailsViewModel.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 01/08/25.
//

import Foundation

final class AnimeDetailsViewModel: ObservableObject {
    private let repository: LocalRepositoryProtocol
    
    init(repository: LocalRepositoryProtocol) {
        self.repository = repository
    }
    
    @Published var showTrailer = false
    @Published var trailerURL: URL? = nil
}
