//
//  ContentView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 16/07/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear {
//            viewModel.getAnimes()
        }
        .padding()
    }
}

//#Preview {
//    MainView()
//}
