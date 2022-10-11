//
//  Movie.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 11.10.2022.
//

import Foundation
import UIKit

struct Movie: Decodable{
    
    var id: Int
    var title: String
    var plot: String
    var poster: String
    //var image: UIImage
    var year: Int32
    var rating: String
    var runTime: String
    var genre: String
    var type: String
    
    /*init(id: Int, dictionary: [String: AnyObject]){
        
        self.id = id
        
        if let title = dictionary["title"] as? String{
            self.title = title
        }
        if let poster = dictionary["poster"] as? String{
            self.poster = poster
        }
       
        if let year = dictionary["year"] as? Int32{
            self.year = year
        }
       
        if let plot = dictionary["plot"] as? String{
            self.plot = plot
        }
        if let type = dictionary["type"] as? String{
            self.type = type
        }
        if let genre = dictionary["genre"] as? String{
            self.genre = genre
        }
        if let type = dictionary["type"] as? String{
            self.type = type
        }
      
    }*/
    
    
}
