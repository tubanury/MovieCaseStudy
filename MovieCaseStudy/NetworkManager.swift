

import Foundation
import UIKit

class NetworkService{
    
    public static let shared = NetworkService()
    
    func fetchCountries(completion:@escaping (Movie) -> ()) {
      
      
      let request = NSMutableURLRequest(url: NSURL(string: "http://www.omdbapi.com/?t=avengers&apikey=8c78aad9")! as URL,
                                        cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
      
      request.httpMethod = "GET"
    
      
      URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error)  in
        do {
          if let data = data {
            let result = try JSONDecoder().decode(Movie.self, from: data)
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
      }).resume()
    }
    
    
    
    private func fetchImage(withUrlString urlString: String, completion: @escaping(UIImage)->()){
        
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

