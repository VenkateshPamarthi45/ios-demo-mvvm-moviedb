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

    var sut = MovieInteractorImpl()
    func test_ApiResponse(){
        sut.fetchMoviesApi(pageId: "1") { (response) in
            XCTAssertNotNil(response)
            let movie = response.results?[0]
            XCTAssertNotNil(movie)
            XCTAssertNotNil(movie?.adult)
            if let adultMovie = movie?.adult{
                XCTAssertTrue(!adultMovie)
            }
        }
    }

}
