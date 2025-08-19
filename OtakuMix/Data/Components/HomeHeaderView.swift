//
//  Home.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 29/07/25.
//

import SwiftUI

struct HomeHeaderView: View {
    let anime: Anime
    let isAddedToMyList: Bool
    let onTrailerTap: () -> Void
    let onMyListTap: () -> Void
    
    var body: some View {
        AsyncImage(url: anime.backdropImageURL) { phase in
            switch phase {
            case .empty:
                HomeHeaderShimmerView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIScreen.main.bounds.height * 0.35)
                    .clipped()
                    .overlay {
                        Rectangle()
                            .fill(Color.black.opacity(0.4))
                    }
                    .overlay(alignment: .bottomLeading) {
                        content()
                    }
            default:
                Rectangle()
                    .fill(.gray.opacity(0.4))
                    .overlay {
                        Image(systemName: "photo.fill")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 80, height: 80)
                                   .foregroundColor(.gray.opacity(0.8))
                                   .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .overlay(alignment: .bottomLeading) {
                        content()
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.35)
             }
        }
        .clipped()
    }
    
    private func content() -> some View {
        VStack(alignment: .leading) {
            Text(anime.title)
                .lineLimit(1)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text(anime.genres.joined(separator: ", "))
                .lineLimit(1)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.85))

            HStack(spacing: 12) {
                if anime.trailerURL != nil {
                    CapsuleButton(
                        title: "Trailer",
                        iconSystemName: "play.circle.fill",
                        isFilled: true
                    ) {
                        onTrailerTap()
                    }
                }
                
                CapsuleButton(
                    title: "My List",
                    iconSystemName: isAddedToMyList ? "checkmark" : "plus",
                    isFilled: false,
                    color: .white
                ) {
                    onMyListTap()
                }
            }
        }
        .padding()
    }
}

#Preview {
    let anime = Anime(
        id: 16498,
        title: "Shingeki no Kyojin",
        titleEnglish: "Attack on Titan",
        type: AnimeType.tv,
        source: "Manga",
        status: OtakuMix.AnimeStatus.finishedAiring,
        score: 8.56,
        posterImageURL: URL(string: "https://cdn.myanimelist.net/images/anime/10/47347.jpg"),
        backdropImageURL: URL(string: "https://cdn.myanimelist.net/images/anime/10/47347l.jpg"),
        genres: [
            "Action", "Award Winning", "Drama", "Suspense"
        ],
        trailerURL: URL(string: "https://www.youtube.com/watch?v=LHtdKWJdif4"),
        synopsis: "",
        year: 2013,
        duration: "24 min per ep",
        episodes: 25,
        aired: "Apr 7, 2013 to Sep 29, 2013",
        rating: "R - 17+ (violence & profanity)",
        rank: 114,
        popularity: 1
    )
    HomeHeaderView(
        anime: anime,
        isAddedToMyList: false,
        onTrailerTap: {},
        onMyListTap: {}
    )
}
