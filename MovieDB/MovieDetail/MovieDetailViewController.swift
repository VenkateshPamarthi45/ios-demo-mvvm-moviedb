//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Venkatesh Pamarthi on 09/06/19.
//  Copyright © 2019 Venkatesh Pamarthi. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    

    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let text = movie?.title {
            labelView.text = text
        }else{
            labelView.text = "No Value"
        }
        if let bannerImageUrl = movie?.backdropPath{
            self.bannerImageView.loadImageFromurl(from: Constants.IMAGE_BASE_URL + bannerImageUrl)
        }
        
        if let posterImageUrl = movie?.posterPath{
            self.posterImageView.loadImageFromurl(from: Constants.IMAGE_BASE_URL + posterImageUrl)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
