//
//  MovieCollectionViewCell.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 13.10.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var MoviePoster: UIImageView!
    
    @IBOutlet weak var MovieTitle: UILabel!
    
    @IBOutlet weak var MovieType: UILabel!
    
    @IBOutlet weak var MovieYear: UILabel!
    
    
    
    
    func set(icon: String?, title: String?, year: String?, type: String?){
        
        Service.shared.fetchImage(withUrlString: icon ?? "") { moviePoster in
            DispatchQueue.main.async {
                self.MoviePoster.image = moviePoster
            }
        }
        
        MovieTitle.text = title
        MovieType.text = type
        MovieYear.text = year
    }
    
    
}
