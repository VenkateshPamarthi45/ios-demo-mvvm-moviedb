//
//  MovieListingService.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 13/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation


protocol MovieListingService {
    func fetchTopRatedMovies(pageId:String, closure:@escaping (MovieListingReponse)->Void)
}
