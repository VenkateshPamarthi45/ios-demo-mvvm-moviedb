//
//  MovieRepositoryConfirms'.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Swinject

class MovieInteractorImpl:MovieInteractor{
    
    var movieListingService:MovieListingService
    
    init(movieLisingService:MovieListingService) {
        self.movieListingService = movieLisingService
    }
    
    /**
     Here in this method data is fetched from api or local database
     - parameters:
        - pageId : this is the page id of the api
        - closure : this is used to return movie listing response
     */
    func fetchMoviesFromDataSource(pageId: String, closure: @escaping (MovieListingReponse)->Void) {
        movieListingService.fetchTopRatedMovies(pageId: pageId) { (response) in
            closure(response)
        }
    }
}



class MovieInteractorImplAssembly : Assembly{
    func assemble(container: Container) {
        container.register(MovieInteractorImpl.self, factory: { r in
            let movieListingService = MovieListingServiceImpl()
            return MovieInteractorImpl(movieLisingService: movieListingService)
        }).inObjectScope(.weak)
    }
}
