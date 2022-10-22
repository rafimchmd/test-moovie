//
//  URLStruct.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation

struct URLStruct {
    static let IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w500"
    static let BASE_MOVIE_DB_URL = "https://api.themoviedb.org/3"
    
    enum MovieDBUrl: String {
        case allMovie = "/discover/movie?api_key="
        case getGenre = "/genre/movie/list?api_key="
        case getTrailer = "/movie"
    }
}
