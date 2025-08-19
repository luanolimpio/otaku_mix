//
//  PosterCardView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 25/07/25.
//

import SwiftUI

struct PosterCardView: View {
    let image: URL?
    let title: String
    let score: String?
    let iconSystemName: String
    let fixedWidth: Bool
    let height: CGFloat
    let onTap: () -> Void
    
    init(
        image: URL?,
        title: String,
        score: String? = nil,
        iconSystemName: String = "star.fill",
        fixedWidth: Bool = true,
        height: CGFloat = 240,
        onTap: @escaping () -> Void
    ) {
        self.image = image
        self.title = title
        self.score = score
        self.iconSystemName = iconSystemName
        self.fixedWidth = fixedWidth
        self.height = height
        self.onTap = onTap
    }
    
    var body: some View {
        AsyncImage(url: image) { phase in
            switch phase {
            case .empty:
                ShimmerView(width: fixedWidth ? 160 : nil, height: height)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(alignment: .topLeading) {
                        scoreContent()
                    }
                    .overlay {
                        LinearGradient(
                                  gradient: Gradient(colors: [.black.opacity(0.3), .clear]),
                                  startPoint: .bottom,
                                  endPoint: .top
                              )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .overlay(alignment: .bottomLeading) {
                        titleContent()
                    }
                    .shadow(radius: 2)
             default:
                RoundedRectangle(cornerRadius: 12)
                    .fill(.gray.opacity(0.4))
                    .overlay {
                        Image(systemName: "photo.fill")
                                   .resizable()
                                   .scaledToFit()
                                   .frame(width: 80, height: 80)
                                   .foregroundColor(.gray.opacity(0.8))
                                   .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .overlay(alignment: .topLeading) {
                        scoreContent()
                    }
                    .overlay(alignment: .bottomLeading) {
                        titleContent()
                    }
                    .frame(width: fixedWidth ? 160 : nil, height: height)
            }
        }
        .frame(width: fixedWidth ? 160 : nil)
        .onTapGesture(perform: onTap)
    }
    
    @ViewBuilder
    private func scoreContent() -> some View {
        if let score = score {
            HStack(spacing: 4) {
                Image(systemName: iconSystemName)
                    .font(.caption)
                    .foregroundStyle(.white)
                   
                Text(score)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            .padding(6)
            .background(Color.darkGray)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .shadow(radius: 4)
            .padding(8)
        }
    }
    
    private func titleContent() -> some View {
        Text(title)
            .lineLimit(1)
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(8)
    }
}

#Preview {
    PosterCardView(
        image: URL(string: "https://cdn.myanimelist.net/images/anime/12/76049.jpg"),
        title: "One Punch Man",
        score: "8.48"
    ) {}
}
