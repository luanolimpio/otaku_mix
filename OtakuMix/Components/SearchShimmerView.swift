//
//  SearchShimmerView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 05/08/25.
//

import SwiftUI

struct SearchShimmerView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(0..<6, id: \.self) { _ in
                    ShimmerView(height: 270)
                }
            }
        }
    }
}

#Preview {
    SearchShimmerView()
}
