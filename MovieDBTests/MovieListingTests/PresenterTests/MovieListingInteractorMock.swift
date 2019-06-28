//
//  MovieListingInteractorMock.swift
//  MovieDBTests
//
//  Created by Venkatesh Pamarthi on 11/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
@testable import MovieDB
import RxSwift


class MockMovieListingInteractorImpl: MovieRepository{
    func fetchMoviesFromDataSource(pageId: String) -> Single<MovieListingReponse> {
        didFetchMoviesApiCalled = true
        return movieListingService.fetchTopRatedMovies(pageId: pageId)
    }
    
    var didFetchMoviesApiCalled = false
    var movieListingService:MovieListingService
    
    init(movieListingService: MovieListingService) {
        self.movieListingService = movieListingService
    }

}
