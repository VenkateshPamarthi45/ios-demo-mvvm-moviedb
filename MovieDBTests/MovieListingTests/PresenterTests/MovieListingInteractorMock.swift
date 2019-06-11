//
//  MovieListingInteractorMock.swift
//  MovieDBTests
//
//  Created by Venkatesh Pamarthi on 11/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
@testable import MovieDB

class MockMovieListingInteractorImpl: MovieInteractor{
    
    var didFetchMoviesApiCalled = false
    
    func fetchMoviesApi(pageId: String, closure: @escaping (MovieListingReponse) -> Void) {
        didFetchMoviesApiCalled = true
        let movies = [Movie(posterPath: "", adult: true, overview: "overview", releaseDate: "1987", genreIDS: [1,2], id: 123, originalTitle: "originalTitle", originalLanguage: "Hindi", title: "title", backdropPath: "image", popularity: 3.0, voteCount: 98, video: true, voteAverage: 9.0)]
        closure(MovieListingReponse(page: 1, results: movies))
    }
    
    
}
