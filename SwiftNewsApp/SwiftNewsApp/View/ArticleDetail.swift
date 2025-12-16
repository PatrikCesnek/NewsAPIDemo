//
//  ArticleDetail.swift
//  SwiftNewsApp
//
//  Created by Patrik Cesnek on 16/12/2025.
//

import SwiftUI

struct ArticleDetailView: View {
    private let article: Article

    init(article: Article) {
        self.article = article
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)
                    .bold()

                if let author = article.author {
                    Text("By \(author)")
                        .foregroundColor(.secondary)
                }

                if let url = article.url, let link = URL(string: url) {
                    Link("Read Full Article", destination: link)
                        .font(.headline)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArticleDetailView(
        article:
            Article(
                title: "Title of the article",
                author: "Author optional",
                url: "https://www.apple.com",
                createdAt: "2025-12-16T14:39:51Z"
            )
    )
}
