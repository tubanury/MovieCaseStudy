//
//  Servicer.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 11.10.2022.
//

import Foundation
import UIKit
import SwiftUI


struct MoviesResult: Codable {
    let Search: [MovieResult]
}

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



class Service{
    
    public static let shared = Service()
    
    func searchMovie(with title: String, completion: @escaping(MoviesResult) -> ()){
        //var movies = [MovieResult]()
        
        guard let url  = URL(string: "http://www.omdbapi.com/?s=avengers&apikey=8c78aad9") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    
                    let result = try JSONDecoder().decode(MoviesResult.self, from: data)
                    //print(result)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        completion(result)
                    }
                } else {
                    print("No data")
                }
            }
            catch(let error) {
                debugPrint(error)
            }
        }.resume()
        
    }
    
    func fetchMovieDetails(with imdbId: String, completion: @escaping(MovieResult) -> ()){
        
        guard let url = URL(string: "http://www.omdbapi.com/?i=tt0848228&apikey=8c78aad9") else {return}
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    
                    let result = try JSONDecoder().decode(MovieResult.self, from: data)
                    //print(result)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        completion(result)
                    }
                } else {
                    print("No data")
                }
            }
            catch(let error) {
                debugPrint(error)
            }
        }.resume()
    }
    
    func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage)->()){
        print(urlString)
        guard let url  = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error =  error {
                print ("fetchin image error", error.localizedDescription)
                return
            }
            
            guard let data  = data  else {return}
            guard let image = UIImage(data: data) else {return}
            
            completion(image)
        }.resume()
    }
}
