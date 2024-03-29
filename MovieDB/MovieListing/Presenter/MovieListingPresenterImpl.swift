//
//  MovieListingViewModelImpl.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 10/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Swinject

class MovieListingPresenterImpl : MovieListingPresenter{
    
    var movieInteractor : MovieInteractor?
    
    init(movieInteractor:MovieInteractor) {
        self.movieInteractor = movieInteractor
    }
    
    func fetchMovies(pageId: String, closure : @escaping (MovieListingReponse)-> Void) {
        movieInteractor?.fetchMoviesFromDataSource(pageId: pageId, closure: { (response) in
            print("return from movie repository \(response)")
            closure(response)
        })
    }
    
}


class MovieListingPresenterImplAssembly : Assembly{
    func assemble(container: Container) {
        container.register(MovieListingPresenterImpl.self, factory: { r in
            let movieInteractor = r.resolve(MovieInteractorImpl.self)
            return MovieListingPresenterImpl(movieInteractor: movieInteractor!)
        }).inObjectScope(.weak)
    }
}
