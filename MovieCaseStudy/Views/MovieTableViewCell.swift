//
//  MovieTableViewCell.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    

    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieGenre: UILabel!

    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieReleaseYear: UIButton!
    
    @IBOutlet weak var MovieDuration: UIButton!
    @IBOutlet weak var MovieRating: UIButton!
    
    @IBOutlet weak var MovieDirector: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(icon: UIImage, title: String, genre: String, year: String, duration: String, rating: String, director: String ){
        MovieImage.image = icon
        MovieTitle.text = title
        MovieGenre.text = genre
        MovieReleaseYear.setTitle(year, for: .normal)
        MovieDuration.setTitle(duration, for: .normal)
        MovieRating.setTitle(rating, for: .normal)
        MovieDirector.setTitle(director, for: .normal)

    }

}
