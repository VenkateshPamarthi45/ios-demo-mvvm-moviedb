//
//  ViewController.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MovieListItemListener {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var movieListingDataSource : MovieListingDataSource!
    private var clickedItemData:Movie?
    
    let data = ["AAA","BBB" ,"CCC","AAA","BBB" ,"CCC","AAA","BBB" ,"CCC","AAA","BBB" ,"CCC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("display progress bar")
        MovieRepositoryConfirms().fetchMoviesApi(pageId: "1") { (movieListingResponse) in
            print("hide progress bar")
            print("view controller response \(movieListingResponse)")
            if let movies = movieListingResponse.results {
                self.movieListingDataSource = MovieListingDataSource(data: movies, listener: self)
                self.collectionView.delegate = self.movieListingDataSource
                self.collectionView.dataSource = self.movieListingDataSource
            }else{
                print("No Movies")
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /**
        This method used as callback from @MovieListingDataSource
        - parameters:
            - data : this is data of selected item in collection view
     */
    func onItemClick(movie: Movie) {
        clickedItemData = movie
        performSegue(withIdentifier: "movieDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? MovieDetailViewController
        destination?.movie = clickedItemData
    }

}

