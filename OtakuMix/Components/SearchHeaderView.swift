//
//  SearchHeaderView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 04/08/25.
//

import SwiftUI

struct SearchHeaderView: View {
    let title: String
    @Binding var query: String
    let onSubmit: () -> Void
    let onFilterTap: () -> Void
    
    @FocusState private var isSearchFocused: Bool
    @State private var isSearching = false
    
    var body: some View {
        HStack {
            if isSearching {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Type what you're looking for...", text: $query)
                        .focused($isSearchFocused)
                        .submitLabel(.search)
                        .disableAutocorrection(true)
                        .onAppear {
                            isSearchFocused = true
                        }
                        .onSubmit {
                            isSearchFocused = false
                            onSubmit()
                        }
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            if query.isEmpty {
                                withAnimation {
                                    isSearching = false
                                }
                                return
                            }
                            query = ""
                        }
                }
                .padding(12)
                .frame(height: 45)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray.opacity(0.1))
                }
                    
                Button(action: {
                    withAnimation {
                        onFilterTap()
                    }
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(8)
                        .frame(width: 45, height: 45)
                        .foregroundStyle(.green)
                        
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.green.opacity(0.2))
                        }
                }
            } else {
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                
                Spacer()
                Button(action: {
                    withAnimation {
                        isSearching = true
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                }
            }

            
        }
        
        .frame(height: 45)
    }
}

#Preview {
    SearchHeaderView(
        title: "Anime",
        query: .constant(""),
        onSubmit: {},
        onFilterTap: {}
    )
    .padding(16)
}
