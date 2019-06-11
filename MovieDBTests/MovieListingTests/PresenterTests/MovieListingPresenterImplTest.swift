//
//  MovieListingPresenterImplTest.swift
//  MovieDBTests
//
//  Created by Venkatesh Pamarthi on 11/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import XCTest
@testable import MovieDB

class MovieListingPresenterImplTest: XCTestCase {
    
    var mockClass : MockMovieListingInteractorImpl!
    var sut : MovieListingPresenterImpl!
    
    override func setUp() {
        mockClass = MockMovieListingInteractorImpl()
        sut = MovieListingPresenterImpl(movieInteractor: mockClass)
    }


    func test_ResponseIsNotNil() {
        sut?.fetchMovies(pageId: "1", closure: { (response) in
                XCTAssertNotNil(response)
        })
    }
    
    func test_ifMovieListingInteractorMethodIsCalled() {
        sut?.fetchMovies(pageId: "1", closure: { (response) in
            
        })
        XCTAssertTrue(mockClass.didFetchMoviesApiCalled)
    }

}
