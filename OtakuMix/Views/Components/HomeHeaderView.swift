//
//  Home.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 29/07/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        AsyncImage(url: URL(string: anime.backdropImagepUrl ?? "no image")) { phase in
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
                                Button(action: {

                                }, label: {
                                    Text("Trailer")
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .background(.green)
                                        .foregroundStyle(.white)
                                        .clipShape(Capsule())
                                })

                                Button(action: {

                                }, label: {
                                    Text("+ My List")
                                        .padding(.horizontal, 16)
                                         .padding(.vertical, 6)
                                        .overlay(Capsule().stroke(.white, lineWidth: 1))
                                        .foregroundStyle(.white)
                                })
                            }
                        }
                        .padding()
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
                                Button(action: {

                                }, label: {
                                    Text("Trailer")
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .background(.green)
                                        .foregroundStyle(.white)
                                        .clipShape(Capsule())
                                })

                                Button(action: {

                                }, label: {
                                    Text("+ My List")
                                        .padding(.horizontal, 16)
                                         .padding(.vertical, 6)
                                        .overlay(Capsule().stroke(.white, lineWidth: 1))
                                        .foregroundStyle(.white)
                                })
                            }
                        }
                        .padding()
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.35)
             }
        }
        .clipped()
    }
}

#Preview {
    Home()
}
