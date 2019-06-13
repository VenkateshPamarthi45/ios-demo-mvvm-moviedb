//
//  MovieListingServiceImpl.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 13/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Alamofire

class MovieListingServiceImpl: MovieListingService {
    
    
    func fetchTopRatedMovies(pageId: String, closure: @escaping (MovieListingReponse) -> Void) {
        Alamofire.request(Constants.BASE_URL+"movie/top_rated?"+Constants.API_KEY+"&language=en-US&page="+pageId).responseJSON { response in
            if(response.response?.statusCode == 200){
                let json = response.data
                do{
                    let decoder = JSONDecoder()
                    let movieListingResponse = try decoder.decode(MovieListingReponse.self, from: json!)
                    closure(movieListingResponse)
                }catch let err{
                    print(err)
                }
            }else{
                if let json = response.result.value {
                    print("JSON: \(json)") // serialized json response
                }
            }
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    
}
