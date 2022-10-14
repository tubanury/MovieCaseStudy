//
//  MovieResult.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 11.10.2022.
//

import Foundation
import UIKit


struct MovieResult: Codable, Hashable {
    
    let Title: String
    let Year: String
    let Poster: String
    let `Type`: String
    let imdbID: String
    let Runtime: String?
    let Director: String?
    let Released: String?
    let Plot: String?
    let imdbRating: String?
    let Genre: String?
}


