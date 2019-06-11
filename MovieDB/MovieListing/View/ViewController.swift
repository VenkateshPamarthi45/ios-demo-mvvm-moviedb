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
    var presenter = (UIApplication.shared.delegate as? AppDelegate)?.mainAssembler.resolver.resolve(MovieListingPresenterImpl.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchMovies(pageId: "1", closure: { (movieListingResponse) in
            self.builtCollectionViewForFirstTimeWithMovies(movieListingResponse: movieListingResponse)
        })
    }
    
    /**
     This method helps render collection view for the first time
     - parameters:
     - movieListingResponse : is instance of MovieListingResponse
     */
    func builtCollectionViewForFirstTimeWithMovies(movieListingResponse: MovieListingReponse){
        if let movies = movieListingResponse.results {
            self.movieListingDataSource = MovieListingDataSource(data: movies, listener: self)
            self.collectionView.delegate = self.movieListingDataSource
            self.collectionView.dataSource = self.movieListingDataSource
        }else{
            print("No Movies")
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

