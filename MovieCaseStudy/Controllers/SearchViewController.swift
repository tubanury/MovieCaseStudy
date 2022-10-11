//
//  SearchViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var MovieTable: UITableView!
    
    let service = Service()
    var moviesSearchDataList: MoviesResult?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieTable.delegate = self
        MovieTable.dataSource = self
        
        getMovies("rings")
        
    }
    
    func getMovies(_ title: String) {
        service.searchMovie(with: title) { movieSearchResult in
            self.moviesSearchDataList = movieSearchResult
            
            if self.moviesSearchDataList?.Search.count ?? 0 > 0 {
                self.MovieTable.reloadData()
            } else {
                let alert = UIAlertController(title: "Error", message: "The movie you searched is not found!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                //self.getMovies("rings")
            }
        }
    }
    

}
extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesSearchDataList?.Search.count ?? 0
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        if let title = moviesSearchDataList?.Search[indexPath.row].Title {
            cell.MovieTitle!.text = title
        }
        cell.set(icon: moviesSearchDataList?.Search[indexPath.row].Poster,
                 title: moviesSearchDataList?.Search[indexPath.row].Title,
                 year: moviesSearchDataList?.Search[indexPath.row].Year,
                 type: moviesSearchDataList?.Search[indexPath.row].Type)
        
        return cell
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

   
}
    

