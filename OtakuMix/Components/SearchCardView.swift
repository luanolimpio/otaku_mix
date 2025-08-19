//
//  SearchCardView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 15/08/25.
//

import SwiftUI

struct SearchCardView: View {
    let image: URL?
    let title: String
    let subTitle: String
    let description: String
    let score: String?
    let iconSystemName: String
    let onTap: () -> Void
    
    init(
        image: URL?,
        title: String,
        subTitle: String,
        description: String,
        score: String? = nil,
        iconSystemName: String = "star.fill",
        onTap: @escaping () -> Void
    ) {
        self.image = image
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.score = score
        self.iconSystemName = iconSystemName
        self.onTap = onTap
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            PosterCardView(
                image: image,
                title: "",
                score: score,
                height: 180
            ) {
                onTap()
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                Text(subTitle)
                    .font(.subheadline)
                Text(description)
                    .font(.footnote)
                    .fontWeight(.light)
                    .lineLimit(2)
                CapsuleButton(
                    title: "My List",
                    iconSystemName: "plus",
                    isFilled: true
                ) {
                    
                }
            }
            .padding(.vertical, 16)
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture(perform: onTap)
    }
}

#Preview {
    SearchCardView(
        image: URL(string: "https://cdn.myanimelist.net/images/anime/12/76049.jpg"),
        title: "One Punch Man",
        subTitle: "2022 | Manga",
        description: "Genre: Action, Award Winning",
        score: "8.48"
    ) {}
}
