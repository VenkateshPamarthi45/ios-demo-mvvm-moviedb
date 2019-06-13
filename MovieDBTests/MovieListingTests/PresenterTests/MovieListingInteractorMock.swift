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
    var movieListingService:MovieListingService
    
    init(movieListingService: MovieListingService) {
        self.movieListingService = movieListingService
    }
    func fetchMoviesFromDataSource(pageId: String, closure: @escaping (MovieListingReponse) -> Void) {
        didFetchMoviesApiCalled = true
        movieListingService.fetchTopRatedMovies(pageId: pageId) { (response) in
            closure(response)
        }
    }

}
