//
//  CommonUtils.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import Foundation
import Alamofire

private let cache = NSCache<NSURL, UIImage>()

extension UIImageView{
    
    func loadImageFromurl(from imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        if let image = cache.object(forKey: url as NSURL){
            DispatchQueue.main.async() {
                self.image = image
            }
        }else{
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                if let image = UIImage(data: data){
                    cache.setObject(image, forKey: url as NSURL)
                    DispatchQueue.main.async() {
                        self.image = image
                    }
                }
            }
            task.resume()
        }
    }
}
