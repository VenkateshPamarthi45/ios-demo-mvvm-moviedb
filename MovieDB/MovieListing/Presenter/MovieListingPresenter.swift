//
//  MovieLisitingViewModel.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 10/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation

protocol MovieListingPresenter {
    
    func fetchMovies(pageId:String, closure : @escaping (MovieListingReponse)-> Void)
}
