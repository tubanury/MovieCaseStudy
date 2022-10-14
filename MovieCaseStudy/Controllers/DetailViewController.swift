//
//  DetailViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 12.10.2022.
//

import UIKit
import FirebaseAnalytics

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieImdbRating: UIButton!
    
    @IBOutlet weak var moviePlot: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
    
    @IBOutlet weak var movieGenre: UILabel!
    
    @IBOutlet weak var movieRuntime: UILabel!
    
    @IBOutlet weak var seperator: UILabel!
    @IBOutlet weak var seperator_2: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    

    var movieImdbId: String?
    var movie: MovieResult?

    let service = Service()

    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
       
        DispatchQueue.main.async {
            self.spinner.startAnimating()
        }
        getMovieDetails(movieImdbId!)
        
    }
  
    func getMovieDetails(_ imdbId: String){
        service.fetchMovieDetails(with: imdbId) { movieSearchResult in
            self.movie = movieSearchResult
            self.configure()
            
        }
    }
    
    func configure(){

        Service.shared.fetchImage(withUrlString: self.movie?.Poster ?? "") { icon in
            DispatchQueue.main.async {
                self.moviePoster.image = icon
            }
        }
        spinner.isHidden = true

        movieTitle.text = self.movie?.Title
        moviePlot.text = self.movie?.Plot
        movieYear.text = self.movie?.Year
        movieGenre.text = self.movie?.Genre?.components(separatedBy: ",")[0]
        movieRuntime.text = self.movie?.Runtime
        
        movieImdbRating.isHidden = false
        movieImdbRating.setTitle(self.movie?.imdbRating, for: .normal)
        
        seperator.isHidden = false
        seperator_2.isHidden = false
        
        
        Analytics.logEvent("MovieTitle", parameters: ["movieTitle" : self.movie?.Title as Any])
        Analytics.logEvent("MovieYear", parameters: ["movieYear" : self.movie?.Year as Any])
        Analytics.logEvent("MovieGenre", parameters: ["movieGenre" : self.movie?.Genre as Any])
        Analytics.logEvent("MovieRuntime", parameters: ["movieRuntime" : self.movie?.Runtime as Any])

    }
  
}
