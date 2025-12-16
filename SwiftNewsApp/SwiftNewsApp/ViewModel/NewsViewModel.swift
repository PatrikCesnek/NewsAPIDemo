//
//  NewsViewModel.swift
//  SwiftNewsApp
//
//  Created by Patrik Cesnek on 16/12/2025.
//

import Foundation
import Observation

@MainActor
@Observable
final class NewsViewModel {

    var topStories: [Article] = []
    var latestStories: [Article] = []

    private let baseURL = "http://localhost:8000/api/news"

    func fetchTopStories() async {
        topStories = await fetch(endpoint: "top")
    }

    func fetchLatestStories() async {
        latestStories = await fetch(endpoint: "latest")
    }

    private func fetch(endpoint: String) async -> [Article] {
        guard let url = URL(string: "\(baseURL)/\(endpoint)/") else {
            return []
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.results
        } catch {
            print("Network error: \(error)")
            return []
        }
    }
}

private struct Response: Decodable {
    let results: [Article]
}
