//
//  MovieService.swift
//  movie-mandiri
//
//  Created by Rafi Mochamad Fahreza on 22/10/22.
//

import Foundation
import RxSwift
import Alamofire

class MovieService: NetworkManager {
    
    static func getAllmovie(url: String, parameter: Parameters?) -> Observable<ResAllMovieStruct> {
        return getApi(object: ResAllMovieStruct.self, url: url, parameter: parameter)
    }
    
    static func getGenre(url: String, parameter: Parameters?) -> Observable<ResGenreStruct> {
        return getApi(object: ResGenreStruct.self, url: url, parameter: parameter)
    }
    
    static func getTrailer(url: String, parameter: Parameters?) -> Observable<ResTrailerStruct> {
        return getApi(object: ResTrailerStruct.self, url: url, parameter: parameter)
    }
    
    static func getReview(url: String, parameter: Parameters?) -> Observable<ResReviewStruct> {
        return getApi(object: ResReviewStruct.self, url: url, parameter: parameter)
    }
}
