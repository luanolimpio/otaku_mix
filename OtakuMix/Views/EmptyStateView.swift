//
//  EmptyView.swift
//  TodoListApp
//
//  Created by Luan Olimpio on 11/07/25.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ContentUnavailableView("No Tasks Yet", systemImage: "pencil.and.list.clipboard", description: Text("Start by adding a new task to stay organized."))
    }
}

#Preview {
    EmptyStateView()
}
