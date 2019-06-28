//
//  MovieRepository.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieRepository {
    func fetchMoviesFromDataSource(pageId:String) -> Single<MovieListingReponse>
}
