//
//  InfoBadgeView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 01/08/25.
//

import SwiftUI

struct InfoBadgeView: View {
    let title: String
    let info: String
    let iconSystemName: String
    let maxWidth: CGFloat?
    
    init(title: String, info: String, iconSystemName: String, maxWidth: CGFloat? = nil) {
        self.title = title
        self.info = info
        self.iconSystemName = iconSystemName
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        HStack {
            Image(systemName: iconSystemName)
                .foregroundStyle(.green)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text(info)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(6)
        .frame(maxWidth: maxWidth, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 4)
                .stroke(.green, lineWidth: 1)
            
        }
    }
}

#Preview {
    InfoBadgeView(
        title: "Aired",
        info: "Apr 7, 2013 to Sep 29, 2013",
        iconSystemName: "calendar"
    )
}
