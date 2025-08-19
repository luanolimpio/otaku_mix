//
//  ActionCapsuleButton.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 03/08/25.
//

import SwiftUI

struct CapsuleButton: View {
    let title: String
    let iconSystemName: String
    let isFilled: Bool
    let color: Color
    let maxWidth: CGFloat?
    let action: () -> Void

    init(
        title: String,
        iconSystemName: String,
        isFilled: Bool,
        color: Color = .green,
        maxWidth: CGFloat? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.iconSystemName = iconSystemName
        self.isFilled = isFilled
        self.color = color
        self.maxWidth = maxWidth
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                Image(systemName: iconSystemName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: maxWidth)
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(isFilled ? color : Color.clear)
            .foregroundStyle(isFilled ? Color.white : color)
            .overlay(
                Capsule()
                    .stroke(isFilled ? Color.clear : color, lineWidth: 2)
            )
            .clipShape(Capsule())
            .shadow(color: color.opacity(0.5), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    ActionCapsuleButton(
        title: "Trailer",
        iconSystemName: "play.circle.fill",
        isFilled: true,
        action: {}
    )
    
    ActionCapsuleButton(
        title: "My List",
        iconSystemName: "plus",
        isFilled: false,
        action: { }
    )
}
