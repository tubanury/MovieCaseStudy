//
//  DetailViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 12.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieImdbRating: UIButton!
    
    @IBOutlet weak var moviePlot: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
    
    @IBOutlet weak var movieGenre: UILabel!
    
    @IBOutlet weak var movieRuntime: UILabel!
    
    var movieImdbId: String?
    let service = Service()
    var movie: MovieResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //test.text = movieImdbId
        movieTitle.text = ""
        moviePlot.text = ""
        movieYear.text = ""
        movieGenre.text = ""
        movieRuntime.text = ""
        getMovieDetails("test")
        
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
        movieTitle.text = self.movie?.Title
        moviePlot.text = self.movie?.Plot
        movieYear.text = self.movie?.Year
        movieGenre.text = self.movie?.Genre
        movieRuntime.text = self.movie?.Runtime

    }
  
}
