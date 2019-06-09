//
//  MovieListingViewCell.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import UIKit

class MovieListingViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    func setText(text:String){
        textLabel.text = text
    }

    func setImage(imageUrl:String){
        self.posterImageView.loadImageFromurl(from: imageUrl)
    }
}
