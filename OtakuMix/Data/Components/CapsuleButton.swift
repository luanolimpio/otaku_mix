//
//  ActionCapsuleButton.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 03/08/25.
//

import SwiftUI

struct CapsuleButton: View {
    let title: String
    let iconSystemName: String?
    let isFilled: Bool
    let color: Color
    let titleColor: Color?
    let maxWidth: CGFloat?
    let onTap: () -> Void

    init(
        title: String,
        iconSystemName: String? = nil,
        isFilled: Bool,
        color: Color = .green,
        titleColor: Color? = nil,
        maxWidth: CGFloat? = nil,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.iconSystemName = iconSystemName
        self.isFilled = isFilled
        self.color = color
        self.titleColor = titleColor
        self.maxWidth = maxWidth
        self.onTap = onTap
    }
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 4) {
                if let icon = iconSystemName {
                    Image(systemName: icon)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: maxWidth)
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(isFilled ? color : Color.clear)
            .foregroundStyle(titleColor != nil ? titleColor! :isFilled ? Color.white : color)
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
    HStack {
        CapsuleButton(
            title: "Trailer",
            iconSystemName: "play.circle.fill",
            isFilled: true,
            onTap: {}
        )
        CapsuleButton(
            title: "My List",
            iconSystemName: "plus",
            isFilled: false,
            onTap: {}
        )
    }
}
