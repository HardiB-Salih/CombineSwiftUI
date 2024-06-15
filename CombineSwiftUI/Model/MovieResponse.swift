//
//  MovieResponse.swift
//  CombineSwiftUI
//
//  Created by HardiB.Salih on 6/15/24.
//

import Foundation
 
let posterBaseOrignalURL = "https://image.tmdb.org/t/p/original/"
let posterBaseW500URL = "https://image.tmdb.org/t/p/w500"


// MARK: - MovieResponse
struct MovieResponse: Codable {
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResults : Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"

        
    }
}

// MARK: - Movie
struct Movie: Identifiable, Codable{
    let adult: Bool
    let backdropPath: String?
    let genreIDs: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDs = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

//MARK: -Computed Property to Movie
extension Movie {
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "\(posterBaseOrignalURL)\(posterPath)")
    }
    
    var backdropURL: URL? {
        guard let backdropPath = backdropPath else { return nil }
        return URL(string: "\(posterBaseOrignalURL)\(backdropPath)")
    }
    
}


//MARK: - Movie Sample Placeholder
extension Movie {
    static let placeholder : Movie = Movie(
        adult: false,
        backdropPath: "/frDS8A5vIP927KYAxTVVKRIbqZw.jpg",
        genreIDs: [
            14,
            28,
            80
        ],
        id: 268,
        originalLanguage: "en",
        originalTitle: "Batman",
        overview: "Batman must face his most ruthless nemesis when a deformed madman calling himself \"The Joker\" seizes control of Gotham\'s criminal underworld.",
        popularity: 70.2,
        posterPath: "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg",
        releaseDate: "1989-06-21",
        title: "Batman",
        video: false,
        voteAverage: 7.232,
        voteCount: 7566
    )

}


//MARK: - MovieResponse Sample Placeholder
extension MovieResponse {
    static let placeholder : MovieResponse = JSONHelper.load("movie.json")
}

