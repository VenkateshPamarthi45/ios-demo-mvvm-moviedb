//
//  MovieListingDataSource.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import UIKit

class MovieListingDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    private let itemsPerRow: CGFloat = 2
    private let padding :CGFloat = 5
    var data : [Movie] = []
    var listener : MovieListItemListener!
    
    convenience init(data:[Movie], listener: MovieListItemListener) {
        self.init()
        self.data = data
        self.listener = listener
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieListingViewCell", for: indexPath) as! MovieListingViewCell
        if let movieTitle = data[indexPath.row].title{
            cell.setText(text: movieTitle)
        }
        if let moviePosterImageUrl = data[indexPath.row].posterPath{
            cell.setImage(imageUrl: Constants.IMAGE_BASE_URL + moviePosterImageUrl)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalPadding = padding * (itemsPerRow - 1)
        let individualPadding = totalPadding / itemsPerRow
        let width:CGFloat = (collectionView.frame.width / itemsPerRow) - individualPadding
        let height = (width * 16) / 11
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("item selected at \(indexPath.row)")
        let movie = data[indexPath.row]
        listener.onItemClick(movie: movie)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }

}
