//
//  EmptyView.swift
//  TodoListApp
//
//  Created by Luan Olimpio on 11/07/25.
//

import SwiftUI

struct EmptyStateView: View {
    let title: String
    let description: String
    
    var body: some View {
        ContentUnavailableView(
            title,
            image: "EmptyState",
            description: Text(description)
        )
    }
}

#Preview {
    EmptyStateView(
        title: "No Results found",
        description: "Try adjusting your search to find what you are looking for"
    )
}
