//
//  FiltersView.swift
//  OtakuMix
//
//  Created by Luan Olimpio on 05/08/25.
//

import SwiftUI

typealias FilterInfo = (
    resourceType: ResourceType,
    animeType: AnimeType?,
    animeStatus: AnimeStatus?,
    mangaType: MangaType?,
    mangaStatus: MangaStatus?,
    genre: Genre?,
    sortType: SortType?
)

struct FiltersView: View {
    let filters: SearchFiltersState
    let onResetTap: (Bool) -> Void
    let onApplyTap: (FilterInfo) -> Void
    
    @State private var selectedResourceType: ResourceType
    @State private var selectedAnimeType: AnimeType?
    @State private var selectedAnimeStatus: AnimeStatus?
    @State private var selectedMangaType: MangaType?
    @State private var selectedMangaStatus: MangaStatus?
    @State private var selectedGenre: Genre?
    @State private var selectedSortType: SortType?
    
    init(
        filters: SearchFiltersState,
        onResetTap: @escaping (Bool) -> Void,
        onApplyTap: @escaping (FilterInfo) -> Void
    ) {
        self.filters = filters
        self.onResetTap = onResetTap
        self.onApplyTap = onApplyTap
        
        _selectedResourceType = State(initialValue: filters.resourceType)
        _selectedAnimeType = State(initialValue: filters.animeType)
        _selectedAnimeStatus = State(initialValue: filters.animeStatus)
        _selectedMangaType = State(initialValue: filters.mangaType)
        _selectedMangaStatus = State(initialValue: filters.mangaStatus)
        _selectedGenre = State(initialValue: filters.genre)
        _selectedSortType = State(initialValue: filters.sortType)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Sort & Filter")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 16)
                .padding(.top, 16)

            List {
                Section {
                    Picker("Search by", selection: $selectedResourceType) {
                        ForEach(ResourceType.allCases, id: \.self) { resource in
                            Text(resource.rawValue).tag(resource)
                        }
                    }

                    if selectedResourceType == .anime {
                        Picker("Type", selection: $selectedAnimeType) {
                            Text("None").tag(nil as AnimeType?)
                            ForEach(AnimeType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type as AnimeType?)
                            }
                        }
                        Picker("Status", selection: $selectedAnimeStatus) {
                            Text("None").tag(nil as AnimeStatus?)
                            ForEach(AnimeStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status as AnimeStatus?)
                            }
                        }
                    } else if selectedResourceType == .manga {
                        Picker("Type", selection: $selectedMangaType) {
                            Text("None").tag(nil as MangaType?)
                            ForEach(MangaType.allCases, id: \.self) { type in
                                Text(type.rawValue).tag(type as MangaType?)
                            }
                        }
                        Picker("Status", selection: $selectedMangaStatus) {
                            Text("None").tag(nil as MangaStatus?)
                            ForEach(MangaStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status as MangaStatus?)
                            }
                        }
                    }

                    if selectedResourceType != .characters {
                        Picker("Genre", selection: $selectedGenre) {
                            Text("None").tag(nil as Genre?)
                            ForEach(Genre.allCases, id: \.self) { genre in
                                Text(genre.displayName).tag(genre as Genre?)
                            }
                        }
                    }
                    
                    Picker("Sort", selection: $selectedSortType) {
                        Text("None").tag(nil as SortType?)
                        ForEach(SortType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type as SortType?)
                        }
                    }
                }
            }

            VStack {
                Divider()
                HStack(spacing: 12) {
                    CapsuleButton(
                        title: "Reset",
                        isFilled: true,
                        color: .green.opacity(0.2),
                        titleColor: .green,
                        maxWidth: .infinity,
                        onTap: { onResetTap(true) }
                    )
                    CapsuleButton(
                        title: "Apply",
                        isFilled: true,
                        maxWidth: .infinity,
                        onTap: {
                            onApplyTap((
                                selectedResourceType,
                                selectedAnimeType,
                                selectedAnimeStatus,
                                selectedMangaType,
                                selectedMangaStatus,
                                selectedGenre,
                                selectedSortType
                            ))
                        }
                    )
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
            }
        }
        .background(Color(UIColor.systemGroupedBackground))
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onChange(of: selectedResourceType, {
            onResetTap(false)
        })
    }
}
#Preview {
    FiltersView(
        filters: SearchFiltersState(),
        onResetTap: { _ in  } ,
        onApplyTap: { _ in }
    )
}
