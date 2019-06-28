//
//  MovieListingViewModelImpl.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 10/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Swinject
import RxSwift

class MovieListingViewModelImpl : MovieListingViewModel{
    
    var movieRepository : MovieRepository?
    var movieListingResponse:Observable<MovieListingReponse>?
    private var disposableBag = DisposeBag()

    
    init(movieRepository:MovieRepository) {
        self.movieRepository = movieRepository
        
    }
    
    func fetchMovies(pageId: String) -> Single<MovieListingReponse> {
        return Single<MovieListingReponse>.create(subscribe: { [weak self] (viewReturnResponse) -> Disposable in
            self?.movieRepository?.fetchMoviesFromDataSource(pageId: pageId).subscribe(onSuccess: { (movieListingResponse) in
                print(movieListingResponse)
                viewReturnResponse(.success(movieListingResponse))
            }, onError: { (err) in
                print(err)
            }).disposed(by: self?.disposableBag ?? DisposeBag())
            return Disposables.create()
        })
    }
    
}


class MovieListingViewModelImplAssembly : Assembly{
    func assemble(container: Container) {
        container.register(MovieListingViewModelImpl.self, factory: { r in
            let movieRepository = r.resolve(MovieRepositoryImpl.self)
            return MovieListingViewModelImpl(movieRepository: movieRepository!)
        }).inObjectScope(.weak)
    }
}
