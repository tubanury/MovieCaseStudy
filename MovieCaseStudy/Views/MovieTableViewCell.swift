//
//  MovieTableViewCell.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    

    @IBOutlet weak var MovieTitle: UILabel!

    @IBOutlet weak var MovieType: UILabel!
    @IBOutlet weak var MovieImage: UIImageView!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(icon: String?, title: String?, year: String?, type: String?){
        
        Service.shared.fetchImage(withUrlString: icon ?? "") { moviePoster in
            DispatchQueue.main.async {
                self.MovieImage.image = moviePoster
            }
        }
        
        MovieTitle.text = title
        MovieType.text = type
    }
}
