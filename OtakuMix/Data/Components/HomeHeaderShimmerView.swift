//
//  HomeHeaderShimmerView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 27/07/25.
//

import SwiftUI

struct HomeHeaderShimmerView: View {
    var body: some View {
        ShimmerView(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height * 0.35,
            cornerRadius: 0
        )
    }
}

#Preview {
    HomeHeaderShimmerView()
}
