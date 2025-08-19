//
//  ExpandableTextView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 31/07/25.
//

import SwiftUI

struct ExpandableTextView: View {
    let text: String
    let lineLimit: Int
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
                .font(.subheadline)
                .fontWeight(.light)
                .lineLimit(isExpanded ? nil : lineLimit)
            
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }, label: {
                Text(!isExpanded ? "View More" : "View Less")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.green)
            })
        }
    }
}

#Preview {
    ExpandableTextView(
        text: "Centuries ago, mankind was slaughtered to near extinction by monstrous humanoid creatures called Titans, forcing humans to hide in fear behind enormous concentric walls.",
        lineLimit: 2
    )
}
