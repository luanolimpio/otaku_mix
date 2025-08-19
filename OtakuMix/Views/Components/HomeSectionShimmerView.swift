//
//  HomeShimmerView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 23/07/25.
//

import SwiftUI

struct HomeSectionShimmerView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ShimmerView(width: 200, height: 20, cornerRadius: 6)
                .padding(.horizontal, 16)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(0..<4) { index in
                        ShimmerView(width: 160, height: 220)
                            .padding(.leading, index == 0 ? 16 : 0)
                            .padding(.trailing, index == 3 ? 16 : 0)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeSectionShimmerView()
}
