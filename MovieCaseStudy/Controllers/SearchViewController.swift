//
//  SearchViewController.swift
//  MovieCaseStudy
//
//  Created by Tuba N. Yıldız on 13.10.2022.
//

import UIKit

class SearchViewController: UIViewController {

   
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var movieCollection: UICollectionView!
    
    let loadingVC = LoadingViewController()
    private var beforeSearchImage = BeforeSearchImageView()

    let service = Service()
    var moviesSearchDataList: MoviesResult?
    var selectedIndex = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollection.delegate = self
        movieCollection.dataSource = self
        searchBar.delegate = self
        addBeforeSearchImageToview()

        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve

    }
   
    private func addBeforeSearchImageToview(){
        beforeSearchImage.translatesAutoresizingMaskIntoConstraints =  false
        view.addSubview(beforeSearchImage)
        
        NSLayoutConstraint.activate([
            beforeSearchImage.topAnchor.constraint(equalTo: view.topAnchor, constant:100),
            beforeSearchImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            beforeSearchImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            beforeSearchImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func getMovies(_ title: String) {
        
        present(loadingVC, animated: true)
        service.searchMovie(with: title) { movieSearchResult in
            self.moviesSearchDataList = movieSearchResult
            self.loadingVC.dismiss(animated: true, completion: nil)

            if self.moviesSearchDataList?.Search?.count ?? 0 > 0 {
                self.movieCollection.reloadData()
            } else {
                self.presentAlert()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovie"{
            let detailVc = segue.destination as! DetailViewController
            detailVc.movieImdbId = moviesSearchDataList?.Search?[selectedIndex].imdbID
        }
    }
    func presentAlert(){
        let alert = UIAlertController(title: "Error", message: "The movie you searched is not found!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try again", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        getMovies(searchText)
    }
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        beforeSearchImage.removeFromSuperview()

    }
}



extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        moviesSearchDataList?.Search?.count ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        if let title = moviesSearchDataList?.Search?[indexPath.row].Title {
            cell.MovieTitle!.text = title
        }
        cell.set(icon: moviesSearchDataList?.Search?[indexPath.row].Poster,
                 title: moviesSearchDataList?.Search?[indexPath.row].Title,
                 year: moviesSearchDataList?.Search?[indexPath.row].Year,
                 type: moviesSearchDataList?.Search?[indexPath.row].Type)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        print(selectedIndex)
        print(indexPath.row)
        print(indexPath)
        self.performSegue(withIdentifier: "toMovie", sender: self )
    }
   
}
