//
//  SearchViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 10.10.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var MovieTable: UITableView!
    
   
    let loadingVC = LoadingViewController()
    let service = Service()
    var moviesSearchDataList: MoviesResult?
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieTable.delegate = self
        MovieTable.dataSource = self
        searchBar.delegate = self
        
        self.navigationController?.navigationBar.isHidden = true
        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }
    
    func getMovies(_ title: String) {
        
        present(loadingVC, animated: true)
        service.searchMovie(with: title) { movieSearchResult in
            self.moviesSearchDataList = movieSearchResult
            self.loadingVC.dismiss(animated: true, completion: nil)

            if self.moviesSearchDataList?.Search?.count ?? 0 > 0 {
                self.MovieTable.reloadData()
            } else {
                let alert = UIAlertController(title: "Error", message: "The movie you searched is not found!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovie"{
            let detailVc = segue.destination as! DetailViewController
            detailVc.movieImdbId = moviesSearchDataList?.Search?[selectedIndex].imdbID
        }
    }
    
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        getMovies(searchText)
    }
    
}
extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moviesSearchDataList?.Search?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        if let title = moviesSearchDataList?.Search?[indexPath.row].Title {
            cell.MovieTitle!.text = title
        }
        cell.set(icon: moviesSearchDataList?.Search?[indexPath.row].Poster,
                 title: moviesSearchDataList?.Search?[indexPath.row].Title,
                 year: moviesSearchDataList?.Search?[indexPath.row].Year,
                 type: moviesSearchDataList?.Search?[indexPath.row].Type)
        
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        self.performSegue(withIdentifier: "toMovie", sender: self )
    }
    
}


