//
//  ResReviewStruct.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

// MARK: - Welcome
struct ResReviewStruct: Codable {
    let id, page: Int
    let results: [ReviewStruct]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ReviewStruct: Codable {
    let author: String
    let content, id: String
    let url: String
}
