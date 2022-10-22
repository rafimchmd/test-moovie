//
//  ResGenreStruct.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

struct ResGenreStruct: Codable {
    var genres: [GenreStruct]?
}

struct GenreStruct: Codable {
    var id: Int
    var name: String
}
