//
//  MovieRepository.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation

protocol MovieInteractor {
    func fetchMoviesApi(pageId:String, closure : @escaping (MovieListingReponse)-> Void)
}
