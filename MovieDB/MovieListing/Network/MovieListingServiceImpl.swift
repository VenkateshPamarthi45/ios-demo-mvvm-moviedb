//
//  MovieListingServiceImpl.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 13/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum APIError: Error{
    case requedstFailure(reason: String?)
    case apiTimeout(reason: String?)
    
    
}

class MovieListingServiceImpl: MovieListingService {
    
    
    func fetchTopRatedMovies(pageId: String) -> Single<MovieListingReponse> {
        return Single<MovieListingReponse>.create{ single -> Disposable in
            Alamofire.request(Constants.BASE_URL+"movie/top_rated?"+Constants.API_KEY+"&language=en-US&page="+pageId).responseJSON { response in
                if(response.response?.statusCode == 200){
                    let json = response.data
                    do{
                        let decoder = JSONDecoder()
                        let movieListingResponse = try decoder.decode(MovieListingReponse.self, from: json!)
                        single(.success(movieListingResponse))
                    }catch let err{
                        print(err)
                        single(.error(err))
                    }
                }else{
                    if let json = response.result.value {
                        print("JSON: \(json)") // serialized json response
                    }
                    single(.error(APIError.requedstFailure(reason: "Bad request")))
                }
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
            }
            return Disposables.create()
        }
        
    }
    
    
}
