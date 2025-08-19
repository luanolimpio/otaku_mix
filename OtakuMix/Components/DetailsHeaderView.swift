//
//  DetailsHeaderView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 30/07/25.
//

import SwiftUI

struct DetailsHeaderView: View {
    let image: URL?
    let onTrailerTap: (() -> Void)?
    
    @Environment(\.dismiss) private var dismiss
    
    init(image: URL?, onTrailerTap: (() -> Void)? = nil) {
        self.image = image
        self.onTrailerTap = onTrailerTap
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            AsyncImage(url: image) { phase in
                switch phase {
                case .empty:
                    ShimmerView(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height * 0.35,
                        cornerRadius: 0
                    )
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .overlay {
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
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
                 }
            }
            .frame(height: UIScreen.main.bounds.height * 0.35)
            .clipped()
            
            HStack {
                Button(action: {
                    dismiss()  
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                Spacer()
                if let onTrailerTap = onTrailerTap {
                    Button(action: {
                        onTrailerTap()
                    }, label: {
                        Image(systemName: "iphone.badge.play")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    })
                }
            }
            .padding(.top, UIScreen.main.bounds.height * 0.35 * 0.2)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    let url = URL(string: "https://cdn.myanimelist.net/images/anime/10/47347l.jpg")
    DetailsHeaderView(image: url, onTrailerTap: {})
}
