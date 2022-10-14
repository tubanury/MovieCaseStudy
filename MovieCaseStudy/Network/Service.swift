//
//  Servicer.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 11.10.2022.
//

import Foundation
import UIKit
import SwiftUI



class Service{
    
    public static let shared = Service()
    
    func searchMovie(with title: String, completion: @escaping(MoviesResult) -> ()){
        
        let urlString = Api.baseUrl + Api.parameterForSearch + title.replacingOccurrences(of: " ", with: "+") + Api.parameterForApikey + Api.apikey
        guard let url  = URL(string: urlString)?.absoluteURL else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(MoviesResult.self, from: data)
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
        
        let urlString = Api.baseUrl + Api.parameterForImdb + imdbId + Api.parameterForApikey + Api.apikey

        guard let url = URL(string: urlString) else {return}
        
        
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
