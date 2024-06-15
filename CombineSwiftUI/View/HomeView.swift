//
//  ContentView.swift
//  CombineSwiftUI
//
//  Created by HardiB.Salih on 6/15/24.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject var homeViewModel  = HomeViewModel(httpClient: HTTPClient())
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(homeViewModel.movies) { movie in
                        MovieRowView(movie: movie)
                    }
                }
            }
            .navigationTitle("Movie")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText)
            .onChange(of: searchText) { oldValue, newValue in
                homeViewModel.setSerchText(newValue)
            }
        }
    }
}

#Preview {
    HomeView()
}


