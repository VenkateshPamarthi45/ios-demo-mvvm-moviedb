//
//  MovieLisitingViewModel.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 10/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieListingViewModel {
    
    func fetchMovies(pageId:String)->Single<MovieListingReponse>
}
