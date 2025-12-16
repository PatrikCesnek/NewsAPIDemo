//
//  Article.swift
//  SwiftNewsApp
//
//  Created by Patrik Cesnek on 16/12/2025.
//

import Foundation

struct Article: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let author: String?
    let url: String?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case title, author, url
        case createdAt = "created_at"
    }
}
