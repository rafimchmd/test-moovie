//
//  ResTrailerStruct.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

// MARK: - Welcome
struct ResTrailerStruct: Codable {
    let id: Int
    let results: [ResSource]
}

// MARK: - Result
struct ResSource: Codable {
    let name, key: String?
    let size: Int?
    let official: Bool?
    let publishedAt, id: String?
}

enum ISO3166_1: String, Codable {
    case us = "US"
}

enum ISO639_1: String, Codable {
    case en = "en"
}

enum Site: String, Codable {
    case youTube = "YouTube"
}

enum TypeEnum: String, Codable {
    case featurette = "Featurette"
    case teaser = "Teaser"
    case trailer = "Trailer"
}
