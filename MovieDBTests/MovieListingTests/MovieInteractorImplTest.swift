//
//  MovieInteractorImplTest.swift
//  MovieDBTests
//
//  Created by Venkatesh Pamarthi on 11/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import XCTest
@testable import MovieDB

class MovieInteractorImplTest: XCTestCase {

    var sut : MovieInteractorImpl!
    var mockClass : MockMovieListingServiceImpl!
    
    override func setUp() {
        mockClass = MockMovieListingServiceImpl()
        sut = MovieInteractorImpl(movieLisingService: mockClass)
    }
    func test_ApiResponse(){
        sut.fetchMoviesFromDataSource(pageId: "1") { (response) in
        }
        XCTAssertTrue(mockClass.didFetchMoviesApiCalled)
    }

}
