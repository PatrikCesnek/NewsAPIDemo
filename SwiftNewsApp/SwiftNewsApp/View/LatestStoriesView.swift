//
//  LatestStoriesView.swift
//  SwiftNewsApp
//
//  Created by Patrik Cesnek on 16/12/2025.
//

import SwiftUI

struct LatestStoriesView: View {

    @State private var viewModel = NewsViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.latestStories) { article in
                    NavigationLink(value: article) {
                        Text(article.title)
                    }
                }
            }
            .navigationTitle("Latest Stories")
            .navigationDestination(for: Article.self) { article in
                ArticleDetailView(article: article)
            }
            .task {
                await viewModel.fetchLatestStories()
            }
        }
    }
}

#Preview {
    LatestStoriesView()
}
