//
//  ShimmerView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 23/07/25.
//

import SwiftUI

import SwiftUI

struct ShimmerView: View {
    var width: CGFloat?
    var height: CGFloat?
    var cornerRadius: CGFloat

    @State private var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State private var endPoint: UnitPoint = .init(x: 0, y: -0.2)

    private var gradientColors = [
        Color.gray.opacity(0.2),
        Color.white.opacity(0.2),
        Color.gray.opacity(0.2)
    ]

    init(width: CGFloat? = nil, height: CGFloat? = nil, cornerRadius: CGFloat = 12) {
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }

    var body: some View {
        LinearGradient(colors: gradientColors, startPoint: startPoint, endPoint: endPoint)
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
                    startPoint = .init(x: 1, y: 1)
                    endPoint = .init(x: 2.2, y: 2.2)
                }
            }
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}

#Preview {
    ShimmerView(width: 250, height: 250)
}

