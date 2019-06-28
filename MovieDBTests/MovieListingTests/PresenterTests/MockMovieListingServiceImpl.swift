//
//  MockMovieListingServiceImpl.swift
//  MovieDBTests
//
//  Created by Venkatesh Pamarthi on 13/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import RxSwift
import RxText
@testable import MovieDB


class MockMovieListingServiceImpl: MovieListingService{
    var didFetchMoviesApiCalled = false
    
    func fetchTopRatedMovies(pageId: String) -> Single<MovieListingReponse> {
        didFetchMoviesApiCalled = true
        let movies = [Movie(posterPath: "", adult: true, overview: "overview", releaseDate: "1987", genreIDS: [1,2], id: 123, originalTitle: "originalTitle", originalLanguage: "Hindi", title: "title", backdropPath: "image", popularity: 3.0, voteCount: 98, video: true, voteAverage: 9.0)]
        return Single<MovieListingReponse>.create(subscribe: { (movieListingResponse) -> Disposable in
            movieListingResponse(.success(MovieListingReponse(page: 1, results: movies)))
            return Disposables.create()
        })
    }
    
    
    
    
}
