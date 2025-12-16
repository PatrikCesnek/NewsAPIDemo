//
//  ContentView.swift
//  SwiftNewsApp
//
//  Created by Patrik Cesnek on 16/12/2025.
//

import SwiftUI

struct ContentView: View {

    @State private var viewModel = NewsViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.topStories) { article in
                    NavigationLink(value: article) {
                        Text(article.title)
                            .font(.headline)
                    }
                }

            }
            .navigationTitle("Top Stories")
            .toolbar(content: {
                NavigationLink {
                    LatestStoriesView()
                } label: {
                    Text("Latest")
                }

            })
            .navigationDestination(for: Article.self) { article in
                ArticleDetailView(article: article)
            }
            .task {
                await viewModel.fetchTopStories()
            }
        }
    }
}

#Preview {
    ContentView()
}
