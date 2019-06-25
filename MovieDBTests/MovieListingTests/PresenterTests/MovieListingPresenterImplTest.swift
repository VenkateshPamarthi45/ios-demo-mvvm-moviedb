//
//  MovieListingPresenterImplTest.swift
//  MovieDBTests
//
//  Created by Venkatesh Pamarthi on 11/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import XCTest
@testable import MovieDB
import RxSwift

class MovieListingPresenterImplTest: XCTestCase {
    
    var mockClass : MockMovieListingInteractorImpl!
    var sut : MovieListingViewModelImpl!
    private var disposableBag = DisposeBag()
    
    
    override func setUp() {
        let movieListingService = MockMovieListingServiceImpl()
        mockClass = MockMovieListingInteractorImpl(movieListingService: movieListingService)
        sut = MovieListingViewModelImpl(movieRepository: mockClass)
    }


    func test_ResponseIsNotNil() {
        sut?.fetchMovies(pageId: "1").subscribe(onSuccess: { (response) in
            XCTAssertNotNil(response)
        }, onError: { (err) in
            print(err)
            XCTAssertNil(err)
        }).disposed(by: disposableBag)
        
    }
    
    func test_ifMovieListingInteractorMethodIsCalled() {
        sut?.fetchMovies(pageId: "1").subscribe(onSuccess: { (response) in
            print(response)
            XCTAssertTrue(self.mockClass.didFetchMoviesApiCalled)
        }, onError: { (err) in
            XCTAssertNil(err)
        }).disposed(by: disposableBag)
        
    }

}
