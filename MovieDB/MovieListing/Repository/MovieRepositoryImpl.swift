//
//  MovieRepositoryConfirms'.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Swinject
import RxSwift

class MovieRepositoryImpl:MovieRepository{
    
    private var movieListingService:MovieListingService
    private var disposableBag = DisposeBag()
    
    init(movieLisingService:MovieListingService) {
        self.movieListingService = movieLisingService
    }
    
    /**
     Here in this method data is fetched from api or local database
     - parameters:
        - pageId : this is the page id of the api
        - closure : this is used to return movie listing response
     */
    func fetchMoviesFromDataSource(pageId: String)->Single<MovieListingReponse> {
        return Single<MovieListingReponse>.create { single -> Disposable in
            self.movieListingService.fetchTopRatedMovies(pageId: pageId).subscribe(onSuccess: { (response) in
                single(.success(response))
            }) { (err) in
                print(err)
                }.disposed(by: self.disposableBag)
            return Disposables.create()
        }
    }
}


class MovieRepositoryImplAssembly : Assembly{
    func assemble(container: Container) {
        container.register(MovieRepositoryImpl.self, factory: { r in
            let movieListingService = MovieListingServiceImpl()
            return MovieRepositoryImpl(movieLisingService: movieListingService)
        }).inObjectScope(.weak)
    }
}
